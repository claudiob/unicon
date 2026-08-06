require 'fileutils'
require 'tmpdir'

# The page shows what the gem defines, so both the data and the artwork are read out of a
# throwaway worktree of `main` rather than kept in a second copy on this branch.
def with_main
  Dir.mktmpdir do |tmp|
    checkout = File.join tmp, 'main'
    system 'git', 'worktree', 'add', '-q', '--detach', checkout, 'main', exception: true
    begin
      yield checkout
    ensure
      system 'git', 'worktree', 'remove', '--force', checkout, exception: true
    end
  end
end

# One vendored SVG made ready to sit in the page: it follows the surrounding text rather
# than carrying the grey the README wants, and the stylesheet sizes it.
def inline(path)
  File.read(path)
      .gsub(/\s*\n\s*/, '')
      .gsub('#888888', 'currentColor')
      .gsub(/\s(?:width|height|class)=(['"])[^'"]*\1/, '')
      .sub('<svg', "<svg class='glyph' aria-hidden='true' focusable='false'")
end

# What one system draws, under a tooltip naming it. SF Symbols come from the operating
# system as pictures, so those are an image; the other two are markup.
def cell(system, label, name, checkout)
  art = case system
          when :bootstrap then inline "#{checkout}/vendor/bootstrap-icons/#{name}.svg"
          when :android then inline "#{checkout}/vendor/material-symbols/#{name}.svg"
          else symbol name, checkout
        end

  "<span title='#{label}: #{name}'>#{art}</span>"
end

# A traced symbol is markup like the other two systems and takes the colour around it. The
# few still waiting to be traced are images, and stay the grey they were drawn in; one the
# macOS that vendored the artwork could not draw at all falls back to a dashed circle,
# the same stand-in the README uses, rather than to a gap.
def symbol(name, checkout)
  traced = "#{checkout}/vendor/sf-symbols/#{name}.svg"
  return inline traced if File.exist? traced

  file = "#{checkout}/vendor/sf-symbols/#{name}.png"
  return inline "#{checkout}/assets/undrawn.svg" unless File.exist? file

  FileUtils.cp file, "sf-symbols/#{name}.png"
  "<img class='glyph' src='sf-symbols/#{name}.png' alt='' width='20' height='20' loading='lazy'>"
end

# One card: the three drawings, the concept, and the names that borrow it. Every one of
# those names goes in `data-search`, which is what lets typing `franchise` find the shop.
def card(concept, names, aliases, checkout)
  art = SYSTEMS.map { |system, label| cell system, label, names.fetch(system), checkout }
  borrowed = aliases.any? ? "\n  <span class='sample-models'>#{aliases.join ' · '}</span>" : ''

  "<li class='sample' data-search='#{[concept, *aliases].join ' '}'>\n" \
    "  <span class='sample-art'>#{art.join}</span>\n" \
    "  <span class='sample-name'>:#{concept}</span>#{borrowed}\n" \
    '</li>'
end

# Replaces the lines between one pair of markers, leaving the rest of the page alone.
def between_markers(page, marker, rows)
  page.sub(/(<!-- #{marker}:start -->\n).*(<!-- #{marker}:end -->)/m) do
    "#{Regexp.last_match 1}#{rows.join "\n"}\n#{Regexp.last_match 2}"
  end
end

# What each column is called where a reader hovers it.
SYSTEMS = { bootstrap: 'Bootstrap Icons', ios: 'SF Symbols', android: 'Material Symbols' }

with_main do |checkout|
  $LOAD_PATH.unshift File.join(checkout, 'lib')
  require 'unicon'

  # Only what the README's table holds: the distinct icons, and the names that borrow one.
  # The four names that borrow an *action* are left out for the same reason it leaves them.
  borrowers = Unicon::ALIASES.group_by { |_, concept| concept }

  FileUtils.rm_rf 'sf-symbols'
  FileUtils.mkdir_p 'sf-symbols'

  cards = Unicon::ICONS.sort.map do |concept, names|
    card concept, names, borrowers.fetch(concept, []).map(&:first).sort, checkout
  end

  File.write 'index.html', (between_markers File.read('index.html'), 'samples', cards)
  puts "#{cards.size} cards written, #{Dir.children('sf-symbols').size} symbols beside them"
end
