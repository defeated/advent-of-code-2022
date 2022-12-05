require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "./"
  t.test_files = ["**/*_test.rb"]
end

task default: :test
