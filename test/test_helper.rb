require 'simplecov'

# Started before anything else is required, or the gem's own files load untracked.
SimpleCov.start do
  skip '/test/'
  minimum_coverage 100
end

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'unicon'

require 'minitest/autorun'
