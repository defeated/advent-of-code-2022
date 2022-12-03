require "minitest/test_task"

Minitest::TestTask.create(:test) do |t|
  t.libs << "./"
  t.test_globs = ["**/*_test.rb"]
end

task default: :test
