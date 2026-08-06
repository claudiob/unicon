require 'bundler/gem_tasks'
require 'minitest/test_task'

Minitest::TestTask.create

require 'rubocop/rake_task'

RuboCop::RakeTask.new

# The three keys every concept carries, and the list of published names behind each.
# The lists are vendored, so validation costs no network call.
NAME_LISTS = {
  bootstrap: 'data/bootstrap-icons.txt',
  ios: 'data/sf-symbols.txt',
  android: 'data/material-symbols.txt',
}.freeze

desc 'Fail unless every icon name appears in the list published by its own design system'
task :validate do
  $LOAD_PATH.unshift File.expand_path('lib', __dir__)
  require 'unicon'

  published = {}
  NAME_LISTS.each { |system, path| published[system] = File.readlines path, chomp: true }

  wrong = Unicon::TABLE.reject { |_, names| names.keys == NAME_LISTS.keys }.keys
  abort "Not keyed #{NAME_LISTS.keys.join ', '}: #{wrong.join ', '}" if wrong.any?

  unpublished = Unicon::TABLE.flat_map do |concept, names|
    names.filter_map do |system, name|
      "#{concept}.#{system}=#{name}" unless published[system].include? name.to_s
    end
  end
  abort "No such icon: #{unpublished.join ', '}" if unpublished.any?

  puts "#{Unicon::TABLE.size} names, #{Unicon::TABLE.size * 3} icon names, all published"
end

# Ceiling for every code file, blank and comment lines included.
MAX_FILE_LINES = 100

# Prose and data are exempt: docs, the license, and the published name lists.
EXEMPT_EXTENSIONS = %w[.md .txt].freeze

# Upstream's artwork and formatting are not ours to fix.
EXEMPT_DIRECTORIES = %w[vendor/].freeze

desc "Fail if any code file is longer than #{MAX_FILE_LINES} lines"
task :file_length do
  files = `git ls-files -z`.split "\x0"
  code = files.reject do |file|
    EXEMPT_EXTENSIONS.include?(File.extname(file)) ||
      EXEMPT_DIRECTORIES.any? { |directory| file.include? directory }
  end
  too_long = code.select { |file| File.readlines(file).size > MAX_FILE_LINES }

  abort "Longer than #{MAX_FILE_LINES} lines: #{too_long.join ', '}" if too_long.any?
end

task default: %i[test validate rubocop file_length]
