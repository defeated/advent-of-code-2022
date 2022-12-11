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

  it "finds the size of the smallest directory that can be deleted" do
    sizes = @tree.values
    used = sizes.first
    available = 70_000_000
    needed = 30_000_000
    free = available - used

    del = sizes.select { |size| free + size >= needed }.min
    puts "del: #{del}"

    expect(del).must_equal 6400111
  end
end
