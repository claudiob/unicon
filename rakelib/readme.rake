# Marks a symbol the rendering machine is older than, and explains the mark under the table.
FALLBACK_MARK = '†'
FALLBACK_NOTE = "#{FALLBACK_MARK} Newer than the macOS that drew this table, which renders " \
                'the SF Symbols 5 set; the name resolves, the picture is on Apple’s site.'

# One cell: what a system draws and what it calls it, or the name alone where nothing drew.
def artwork_cell(system, name)
  path = system == :ios ? (artwork_path system, name) : (artwork system, name)
  return "`#{name}` #{FALLBACK_MARK}" unless File.exist? path

  "![#{name}](#{path}) `#{name}`"
end

# One row of the concept table: the concept, then each system's icon beside its name.
def concept_row(concept, names)
  cells = [
    "`:#{concept}`",
    artwork_cell(:bootstrap, names.fetch(:bootstrap)),
    artwork_cell(:ios, names.fetch(:ios)),
    artwork_cell(:android, names.fetch(:android)),
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

  symbols = Unicon::MEANINGS.each_value.map { |names| names.fetch :ios }
  undrawn = render_symbols symbols

  concepts = [
    '| Concept | Bootstrap Icons | SF Symbols | Material Symbols |',
    '| --- | --- | --- | --- |',
  ]
  Unicon::MEANINGS.each { |concept, names| concepts << (concept_row concept, names) }
  concepts += ['', FALLBACK_NOTE] if undrawn.any?

  models = ['| Model name | Concept it draws |', '| --- | --- |']
  Unicon::ALIASES.each { |model, concept| models << "| `:#{model}` | `:#{concept}` |" }

  readme = File.read 'README.md'
  readme = between_markers readme, 'concepts', concepts
  File.write 'README.md', (between_markers readme, 'models', models)
  warn "no artwork for #{undrawn.join ', '}" if undrawn.any?
  puts "#{Unicon::MEANINGS.size} concepts and #{Unicon::ALIASES.size} model names written"
end
