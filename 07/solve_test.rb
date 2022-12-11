require_relative "../test_helper"
require "pathname"
require "strscan"

describe "day 07" do
  before do
    @tree = Hash.new(0)

    cwd = Pathname.new("/")
    data = File.readlines(__dir__ + "/data.txt", chomp: true)
    data.each do |line|

      scanner = StringScanner.new(line)

      if scanner.scan("$ cd ")
        cwd = scanner.scan("..") ? cwd.parent : cwd.join(scanner.rest)
      end

      if scanner.scan(/(\d+)/)
        size = scanner.matched.to_i
        cwd.ascend { |path| @tree[path.to_s] += size }
      end

    end
  end

  it "sums the total size of directories less than or equal to 100,000" do
    max = 100_000

    total = @tree.values.select { |v| v <= max }.sum
    puts "total: #{total}"

    expect(total).must_equal 1491614
  end

  # it "..." do
  #   skip
  #   expect(0).must_equal 0
  # end
end
