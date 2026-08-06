require 'fileutils'
require 'open-uri'
require 'tmpdir'

# Where the artwork in two of the three columns comes from, pinned so a regenerated README
# shows what this one shows. SF Symbols is absent because Apple publishes no files to
# fetch: the symbols come from the operating system, drawn by `tools/sf_symbols.swift`.
ARTWORK = {
  bootstrap: 'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/icons/NAME.svg',
  android: 'https://cdn.jsdelivr.net/gh/google/material-design-icons@50f0603/symbols/web/' \
           'NAME/materialsymbolsoutlined/NAME_24px.svg',
}.freeze

# Where the copy of each system's artwork is kept.
ARTWORK_DIRECTORIES = {
  bootstrap: 'vendor/bootstrap-icons', ios: 'vendor/sf-symbols', android: 'vendor/material-symbols',
}.freeze

# Gray rather than black, so every row reads on a light and a dark theme alike.
ARTWORK_FILL = '#888888'

# The two attributes a vendored copy differs from upstream in.
ARTWORK_SIZE = 20

# Recolors and resizes one upstream file, which is all a vendored copy changes.
def restyled(svg)
  colored = svg.gsub 'currentColor', ARTWORK_FILL
  root = colored[/<svg[^>]*>/]
  colored = colored.sub '<svg', "<svg fill='#{ARTWORK_FILL}'" unless root.include? 'fill='
  colored.gsub(/(width|height)="\d+"/, "\\1='#{ARTWORK_SIZE}'")
end

# The path an icon's artwork is vendored at, whether or not anything is there yet. A symbol
# is an SVG wherever the renderer managed to trace one, and the PNG it drew before that
# everywhere else, so both spellings are looked for and the SVG is what a new one becomes.
def artwork_path(system, name)
  directory = ARTWORK_DIRECTORIES.fetch system
  return "#{directory}/#{name}.svg" unless system == :ios

  drawn = %W[#{directory}/#{name}.svg #{directory}/#{name}.png]
  drawn.find { |path| File.exist? path } || drawn.first
end

# The path to a downloaded icon, fetching it the first time it is asked for.
def artwork(system, name)
  path = artwork_path system, name
  return path if File.exist? path

  template = ARTWORK.fetch system
  FileUtils.mkdir_p File.dirname(path)
  File.write path, (restyled URI.parse(template.gsub('NAME', name.to_s)).read)
  path
end

# Draws every symbol not vendored yet, and answers the names this macOS could not draw.
# A symbol newer than the running system has no artwork here to render from, which is why
# a failure is reported rather than fatal: `rake validate` has already proved the name real.
def render_symbols(names)
  missing = names.reject { |name| File.exist? artwork_path :ios, name }
  return [] if missing.empty?

  report = drawn_by_macos missing
  report.lines.filter_map { |line| line.split.last if line.start_with? 'unavailable' }
end

# Compiles the renderer and hands it the names, answering what it said about each.
def drawn_by_macos(names)
  binary = File.join Dir.tmpdir, 'unicon_sf_symbols'
  sh "swiftc -O -o #{binary} tools/sf_symbols.swift"
  IO.popen [binary, ARTWORK_DIRECTORIES.fetch(:ios)], 'r+' do |renderer|
    renderer.write names.join("\n")
    renderer.close_write
    renderer.read
  end
end
