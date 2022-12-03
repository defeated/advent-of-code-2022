require_relative "../test_helper"
require "csv"

describe "day 01" do
  before do
    row_sep = "---"
    file = File.dirname(__FILE__) + "/data.txt"
    data = File.read(file).chomp.gsub("\n\n", row_sep).gsub("\n", ",")
    table = CSV.parse data, row_sep: row_sep, converters: :numeric
    @totals = table.map(&:sum)
  end

  it "calculates largest" do
    max = @totals.max
    puts "max: #{max}"
    expect(max).must_equal 70369
  end

  it "sums top 3" do
    top3 = @totals.sort.last(3)
    sum = top3.sum
    puts "sum: #{sum}"
    expect(sum).must_equal 203002
  end
end
