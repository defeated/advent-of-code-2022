require "bundler/inline"
gemfile do
  source "https://rubygems.org"
  gem "minitest-reporters"
  gem "matrix" # removed in ruby 3.1.0
end

require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
