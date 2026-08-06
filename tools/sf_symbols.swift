// Renders SF Symbols to PNG, one per name read from stdin, into the directory given as
// the first argument. Prints `ok <name>` or `unavailable <name>` per line, so the caller
// can tell a symbol this macOS cannot draw from one it simply has not fetched yet.
//
// Run with: swift tools/sf_symbols.swift vendor/sf-symbols

import AppKit

let box = 20.0
let fill = NSColor(srgbRed: 0x88 / 255.0, green: 0x88 / 255.0, blue: 0x88 / 255.0, alpha: 1)
let configuration = NSImage.SymbolConfiguration(pointSize: 48, weight: .regular)

func png(of symbol: NSImage) -> Data? {
    let size = symbol.size
    let scale = min(box / size.width, box / size.height)
    let drawn = NSRect(x: (box - size.width * scale) / 2, y: (box - size.height * scale) / 2,
                       width: size.width * scale, height: size.height * scale)
    guard let rep = NSBitmapImageRep(
        bitmapDataPlanes: nil, pixelsWide: Int(box), pixelsHigh: Int(box), bitsPerSample: 8,
        samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB,
        bytesPerRow: 0, bitsPerPixel: 0
    ) else { return nil }

    rep.size = NSSize(width: box, height: box)
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
    NSGraphicsContext.current?.imageInterpolation = .high
    symbol.draw(in: drawn)
    fill.set()
    NSRect(x: 0, y: 0, width: box, height: box).fill(using: .sourceIn)
    NSGraphicsContext.restoreGraphicsState()

    return rep.representation(using: .png, properties: [:])
}

guard CommandLine.arguments.count == 2 else {
    FileHandle.standardError.write(Data("usage: sf_symbols.swift <directory>\n".utf8))
    exit(2)
}

let directory = CommandLine.arguments[1]
try? FileManager.default.createDirectory(atPath: directory, withIntermediateDirectories: true)

var written = 0
var unavailable: [String] = []

while let name = readLine(strippingNewline: true), !name.isEmpty {
    guard let symbol = NSImage(systemSymbolName: name, accessibilityDescription: nil)?
        .withSymbolConfiguration(configuration), let data = png(of: symbol) else {
        unavailable.append(name)
        print("unavailable \(name)")
        continue
    }

    do {
        try data.write(to: URL(fileURLWithPath: "\(directory)/\(name).png"))
        written += 1
        print("ok \(name)")
    } catch {
        FileHandle.standardError.write(Data("cannot write \(name): \(error)\n".utf8))
        exit(1)
    }
}

let summary = "rendered \(written), unavailable \(unavailable.count)"
FileHandle.standardError.write(Data("\(summary): \(unavailable.joined(separator: " "))\n".utf8))
