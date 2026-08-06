require 'fileutils'
require 'open-uri'

# Where the artwork in each column comes from, pinned so a regenerated README shows
# what this one shows. SF Symbols is deliberately absent: Apple's licence keeps the
# symbols on Apple platforms, so the README prints the name and links to Apple.
ARTWORK = {
  bootstrap: 'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/icons/NAME.svg',
  android: 'https://cdn.jsdelivr.net/gh/google/material-design-icons@50f0603/symbols/web/' \
           'NAME/materialsymbolsoutlined/NAME_24px.svg',
}.freeze

# Where the copy of each system's artwork is kept.
ARTWORK_DIRECTORIES = {
  bootstrap: 'vendor/bootstrap-icons', android: 'vendor/material-symbols',
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

# The path to an icon's vendored artwork, downloading it the first time it is asked for.
def artwork(system, name)
  directory = ARTWORK_DIRECTORIES.fetch system
  path = "#{directory}/#{name}.svg"
  return path if File.exist? path

  template = ARTWORK.fetch system
  FileUtils.mkdir_p directory
  File.write path, (restyled URI.parse(template.gsub('NAME', name.to_s)).read)
  path
end

# One row of the concept table: the concept, then what each system draws and calls it.
def concept_row(concept, names)
  bootstrap = names.fetch :bootstrap
  android = names.fetch :android
  cells = [
    "`:#{concept}`",
    "![#{bootstrap}](#{artwork :bootstrap, bootstrap}) `#{bootstrap}`",
    "`#{names.fetch :ios}`",
    "![#{android}](#{artwork :android, android}) `#{android}`",
  ]
  "| #{cells.join ' | '} |"
end

# Replaces the lines between one pair of markers in the README, leaving the prose alone.
def between_markers(readme, marker, rows)
  readme.sub(/(<!-- #{marker}:start -->\n).*(<!-- #{marker}:end -->)/m) do
    "#{Regexp.last_match 1}#{rows.join "\n"}\n#{Regexp.last_match 2}"
  end
end

desc 'Rewrite the tables in README.md, vendoring any artwork they are missing'
task :readme do
  $LOAD_PATH.unshift File.expand_path('../lib', __dir__)
  require 'unicon'

  concepts = [
    '| Concept | Bootstrap Icons | SF Symbols | Material Symbols |',
    '| --- | --- | --- | --- |',
  ]
  Unicon::MEANINGS.each { |concept, names| concepts << (concept_row concept, names) }

  models = ['| Model name | Concept it draws |', '| --- | --- |']
  Unicon::ALIASES.each { |model, concept| models << "| `:#{model}` | `:#{concept}` |" }

  readme = File.read 'README.md'
  readme = between_markers readme, 'concepts', concepts
  File.write 'README.md', (between_markers readme, 'models', models)
  puts "#{Unicon::MEANINGS.size} concepts and #{Unicon::ALIASES.size} model names written"
end
