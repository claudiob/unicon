// Renders SF Symbols to SVG, one per name read from stdin, into the directory given as the
// first argument. Prints `ok <name>` or `unavailable <name>` per line, so the caller can tell
// a symbol this Mac cannot draw from one it simply has not fetched yet.
//
// Two Apple sources, because neither answers alone. `NSImage(systemSymbolName:)` knows what
// a name draws but only ever hands back pixels; the fallback font inside SF Symbols.app holds
// the outlines but files them under private-use codepoints rather than under their names.
// So the picture the system draws for a name is fingerprinted and matched against every glyph
// in the font, and the winner's outline is what gets written. A match is only accepted when it
// is close and when nothing else comes near it — a wrong glyph is worse than a missing one.
//
// Run with: swiftc -O -o /tmp/renderer tools/sf_symbols.swift && /tmp/renderer vendor/sf-symbols

import AppKit
import CoreText

let fallback = "/Applications/SF Symbols.app/Contents/Resources/Fonts/SFSymbolsFallback.otf"
let fill = "#888888"
let canvas = 128
let grid = 24
// A match this far off is not the same drawing, and one only this much better than the
// runner-up is a coin toss. Both were an order of magnitude clear on the set we vendor.
let near = 0.09
let decisive = 1.6
// Unless the runner-up is the same drawing under a second codepoint, which the font does
// carry: then there is nothing to be undecided about and the first will do.
let same = 0.02

// Whatever was drawn, reduced to ink coverage on a fixed grid: trimmed to what it actually
// covers and then resampled, so two drawings of one shape compare however either was sized.
func fingerprint(_ draw: (CGContext) -> Void) -> [Double]? {
    let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: canvas, pixelsHigh: canvas,
        bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false,
        colorSpaceName: .deviceRGB, bytesPerRow: canvas * 4, bitsPerPixel: 32)!
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
    NSColor.black.setFill()
    draw(NSGraphicsContext.current!.cgContext)
    NSGraphicsContext.restoreGraphicsState()

    let pixels = rep.bitmapData!
    // Softened first. The system hands back a raster it then scales, so its strokes arrive
    // fatter and fuzzier than the same outline filled directly; blurring both to the same
    // degree is what lets one be recognised as the other.
    var coverage = (0..<(canvas * canvas)).map { Double(pixels[$0 * 4 + 3]) / 255 }
    let radius = 2
    var softened = coverage
    for y in 0..<canvas {
        for x in 0..<canvas {
            var total = 0.0, counted = 0.0
            for dy in -radius...radius where (y + dy) >= 0 && (y + dy) < canvas {
                for dx in -radius...radius where (x + dx) >= 0 && (x + dx) < canvas {
                    total += coverage[(y + dy) * canvas + x + dx]
                    counted += 1
                }
            }
            softened[y * canvas + x] = total / counted
        }
    }
    coverage = softened
    func alpha(_ x: Int, _ y: Int) -> Double { coverage[y * canvas + x] }

    var minX = canvas, minY = canvas, maxX = -1, maxY = -1
    for y in 0..<canvas {
        for x in 0..<canvas where alpha(x, y) > 0.06 {
            minX = min(minX, x); maxX = max(maxX, x)
            minY = min(minY, y); maxY = max(maxY, y)
        }
    }
    guard maxX >= minX, maxY >= minY else { return nil }

    // Cells are averaged rather than sampled at a point: a hairline stroke falls between
    // two sample points as readily as on one, and point sampling scored two renderings of
    // one hammer as far apart as two different symbols.
    let width = Double(maxX - minX + 1), height = Double(maxY - minY + 1)
    return (0..<(grid * grid)).map { cell in
        let left = minX + Int(Double(cell % grid) / Double(grid) * width)
        let right = minX + max(Int(Double(cell % grid + 1) / Double(grid) * width) - 1, 0)
        let top = minY + Int(Double(cell / grid) / Double(grid) * height)
        let bottom = minY + max(Int(Double(cell / grid + 1) / Double(grid) * height) - 1, 0)
        var total = 0.0, counted = 0.0
        for y in top...max(bottom, top) {
            for x in left...max(right, left) {
                total += alpha(min(x, maxX), min(y, maxY))
                counted += 1
            }
        }
        return total / counted
    }
}

func print(of path: CGPath) -> [Double]? {
    let bounds = path.boundingBoxOfPath
    let scale = Double(canvas - 8) / max(bounds.width, bounds.height)
    return fingerprint { context in
        context.translateBy(x: (Double(canvas) - bounds.width * scale) / 2 - bounds.minX * scale,
                            y: (Double(canvas) - bounds.height * scale) / 2 - bounds.minY * scale)
        context.scaleBy(x: scale, y: scale)
        context.addPath(path)
        // Even-odd, matching what the SVG says: a speech bubble whose counter is wound the
        // same way as its outline fills in solid under the nonzero rule, and then no longer
        // resembles the speech bubble the system drew.
        context.fillPath(using: .evenOdd)
    }
}

func print(of image: NSImage) -> [Double]? {
    let scale = min(Double(canvas - 8) / image.size.width, Double(canvas - 8) / image.size.height)
    let box = NSRect(x: (Double(canvas) - image.size.width * scale) / 2,
                     y: (Double(canvas) - image.size.height * scale) / 2,
                     width: image.size.width * scale, height: image.size.height * scale)
    return fingerprint { _ in image.draw(in: box) }
}

// The outline as SVG, on the typographic box the font lays the glyph out in rather than on
// its own extent: every symbol then keeps the size it has beside the others, and a viewer
// that draws it in a square letterboxes it exactly as the system does.
func svg(of path: CGPath, advance: Double, ascent: Double, descent: Double) -> String {
    var data = ""
    func place(_ point: CGPoint) -> String {
        String(format: "%.1f %.1f", point.x, ascent - point.y)
    }
    path.applyWithBlock { element in
        let points = element.pointee.points
        switch element.pointee.type {
            case .moveToPoint: data += "M\(place(points[0]))"
            case .addLineToPoint: data += "L\(place(points[0]))"
            case .addQuadCurveToPoint: data += "Q\(place(points[0])) \(place(points[1]))"
            case .addCurveToPoint:
                data += "C\(place(points[0])) \(place(points[1])) \(place(points[2]))"
            default: data += "Z"
        }
    }

    let height = ascent + descent
    return "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='\(fill)' " +
        String(format: "viewBox='0 0 %.1f %.1f'>", advance, height) +
        "<path fill-rule='evenodd' d='\(data)'/></svg>\n"
}

guard CommandLine.arguments.count == 2 else {
    FileHandle.standardError.write(Data("usage: sf_symbols.swift <directory>\n".utf8))
    exit(2)
}

let directory = CommandLine.arguments[1]
try? FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true)

guard let data = try? Data(contentsOf: URL(fileURLWithPath: fallback)),
      let provider = CGDataProvider(data: data as CFData), let outlines = CGFont(provider) else {
    FileHandle.standardError.write(Data("no SF Symbols.app to read outlines from\n".utf8))
    exit(1)
}

let font = CTFontCreateWithGraphicsFont(outlines, 100, nil, nil)
let ascent = CTFontGetAscent(font), descent = CTFontGetDescent(font)

// Every outline the font holds, fingerprinted once: each name is then a lookup rather than
// ten thousand renders of its own.
var glyphs: [(CGGlyph, CGPath, [Double])] = []
for code in UInt32(0x100000)...UInt32(0x10FFFD) {
    guard let scalar = UnicodeScalar(code) else { continue }
    var characters = Array(String(scalar).utf16)
    var found = [CGGlyph](repeating: 0, count: characters.count)
    guard CTFontGetGlyphsForCharacters(font, &characters, &found, characters.count), found[0] != 0,
          let path = CTFontCreatePathForGlyph(font, found[0], nil), let mark = print(of: path)
    else { continue }
    glyphs.append((found[0], path, mark))
}

// How unlike two coverage maps are: correlation, so a fatter stroke of the same shape
// still reads as that shape. 0 is identical.
func distance(_ one: [Double], _ other: [Double]) -> Double {
    var dot = 0.0, left = 0.0, right = 0.0
    for i in 0..<one.count {
        dot += one[i] * other[i]
        left += one[i] * one[i]
        right += other[i] * other[i]
    }
    return 1 - dot / max((left * right).squareRoot(), 1e-9)
}

let configuration = NSImage.SymbolConfiguration(pointSize: 96, weight: .regular)
var written = 0
var unavailable: [String] = []

while let name = readLine(strippingNewline: true), !name.isEmpty {
    guard let image = NSImage(systemSymbolName: name, accessibilityDescription: nil)?
        .withSymbolConfiguration(configuration), let wanted = print(of: image) else {
        unavailable.append(name)
        Swift.print("unavailable \(name)")
        continue
    }

    let scored = glyphs.map { glyph, path, mark in
        (glyph, path, mark, distance(mark, wanted))
    }.sorted { $0.3 < $1.3 }

    guard let best = scored.first, best.3 < near,
          scored[1].3 > best.3 * decisive || distance(best.2, scored[1].2) < same else {
        unavailable.append(name)
        Swift.print("unmatched \(name)")
        continue
    }

    var advance = CGSize.zero
    var glyph = best.0
    CTFontGetAdvancesForGlyphs(font, .horizontal, &glyph, &advance, 1)
    let drawing = svg(of: best.1, advance: advance.width, ascent: ascent, descent: descent)

    do {
        try drawing.write(toFile: "\(directory)/\(name).svg", atomically: true, encoding: .utf8)
        written += 1
        Swift.print("ok \(name)")
    } catch {
        FileHandle.standardError.write(Data("cannot write \(name): \(error)\n".utf8))
        exit(1)
    }
}

let summary = "rendered \(written), unavailable \(unavailable.count)"
FileHandle.standardError.write(Data("\(summary): \(unavailable.joined(separator: " "))\n".utf8))
