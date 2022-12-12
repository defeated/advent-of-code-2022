require_relative "../test_helper"
require "matrix"

describe "day 08" do
  before do
    data = File.readlines(__dir__ + "/data.txt", chomp: true).map(&:chars)
    @grid = Matrix[*data].map(&:to_i)
  end

  it "counts trees visible from outside the grid" do
    visible = 0
    @grid.each_with_index do |i, r, c|

      # top or bottom edge
      if r == 0 || r == @grid.row_size - 1
        visible += 1
        next
      end

      # left or right edge
      if c == 0 || c == @grid.column_size - 1
        visible += 1
        next
      end

      row = @grid.row(r)
      col = @grid.column(c)

      left, right = row[...c], row[c + 1...]
      top, bottom = col[...r], col[r + 1...]

      gt = ->(x){ i > x }
      visible += 1 if left.all?(gt)   ||
                      right.all?(gt)  ||
                      top.all?(gt)    ||
                      bottom.all?(gt)

    end

    puts "visible: #{visible}"

    expect(visible).must_equal 1789
  end

  it "..." do
    skip
    expect(0).must_equal 1
  end
end
