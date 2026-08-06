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

# Grey rather than black, so every row reads on a light and a dark theme alike.
ARTWORK_FILL = '#888888'

# The two attributes a vendored copy differs from upstream in.
ARTWORK_SIZE = 20

# Recolours and resizes one upstream file, which is all a vendored copy changes.
def restyled(svg)
  coloured = svg.gsub 'currentColor', ARTWORK_FILL
  root = coloured[/<svg[^>]*>/]
  coloured = coloured.sub '<svg', "<svg fill='#{ARTWORK_FILL}'" unless root.include? 'fill='
  coloured.gsub(/(width|height)="\d+"/, "\\1='#{ARTWORK_SIZE}'")
end

# The path an icon's artwork is vendored at, whether or not anything is there yet.
def artwork_path(system, name)
  extension = system == :ios ? 'png' : 'svg'
  "#{ARTWORK_DIRECTORIES.fetch system}/#{name}.#{extension}"
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
