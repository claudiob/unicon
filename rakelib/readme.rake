# Stands in for a symbol the rendering machine is too old to draw, since a cell shows
# artwork and never a name. Ours, not Apple's, and explained under the table.
UNDRAWN = 'assets/undrawn.svg'
UNDRAWN_NOTE = 'A dashed circle is a symbol newer than the macOS that drew this table, ' \
               'which knows the SF Symbols 5 set. Hover it for the name, which resolves ' \
               'in an app built against a newer SDK.'

# One cell: the icon alone, carrying its name where a hover and a screen reader find it.
def artwork_cell(system, name)
  path = system == :ios ? (artwork_path system, name) : (artwork system, name)
  return "![#{name}](#{UNDRAWN} \"#{name}\")" unless File.exist? path

  "![#{name}](#{path} \"#{name}\")"
end

# One row: the concept, the names that alias it, and what each system draws for it.
def concept_row(concept, names, aliases)
  cells = [
    "`:#{concept}`",
    aliases.map { |name| "`:#{name}`" }.join(' '),
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

desc 'Rewrite the concept table in README.md, vendoring any artwork it is missing'
task :readme do
  $LOAD_PATH.unshift File.expand_path('../lib', __dir__)
  require 'unicon'

  symbols = Unicon::ICONS.each_value.map { |names| names.fetch :ios }
  undrawn = render_symbols symbols
  borrowers = Unicon::ALIASES.group_by { |_, concept| concept }

  rows = [
    '| Icon | Aliases | Bootstrap | iOS | Android |',
    '| --- | --- | --- | --- | --- |',
  ]
  Unicon::ICONS.sort.each do |concept, names|
    aliases = borrowers.fetch(concept, []).map(&:first).sort
    rows << (concept_row concept, names, aliases)
  end
  rows += ['', UNDRAWN_NOTE] if undrawn.any?

  File.write 'README.md', (between_markers File.read('README.md'), 'concepts', rows)
  warn "no artwork for #{undrawn.join ', '}" if undrawn.any?
  puts "#{Unicon::ICONS.size} icons written, #{Unicon::ALIASES.size} aliases beside them"
end
