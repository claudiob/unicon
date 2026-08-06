require_relative 'lib/unicon/version'

Gem::Specification.new do |spec|
  spec.name = 'unicon'
  spec.version = Unicon::VERSION
  spec.authors = ['claudiob']
  spec.email = ['claudiob@users.noreply.github.com']

  spec.summary = 'One concept, the icon for it in Bootstrap Icons, SF Symbols and Material.'
  spec.description = 'Unicon maps a concept — a house, a phone, a contact — to the name ' \
                     'of the icon that stands for it in Bootstrap Icons, SF Symbols and ' \
                     'Material Symbols. A concept is only listed when all three have an ' \
                     'icon for it, and every name is checked against the list its own ' \
                     'design system publishes, so nothing renders as an empty box.'
  spec.homepage = 'https://github.com/claudiob/unicon'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'
  spec.metadata['source_code_uri'] = spec.homepage

  # Whatever git tracks, less what only a contributor needs, so nothing untracked leaks in.
  gemspec = File.basename __FILE__
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[Gemfile Rakefile data/ vendor/ test/ .gitignore .rubocop.yml])
    end
  end
  spec.require_paths = ['lib']
end
