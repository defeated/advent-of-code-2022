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
      visible += 1 and next if r.zero? || r == @grid.row_size - 1    # top/bottom edge
      visible += 1 and next if c.zero? || c == @grid.column_size - 1 # left/right edge

      row = @grid.row(r)
      col = @grid.column(c)

      left, right = row[...c], row[c + 1...]
      top, bottom = col[...r], col[r + 1...]

      gt = ->(x){ i > x }
      visible += 1 if left.all?(gt) || right.all?(gt) || top.all?(gt) || bottom.all?(gt)
    end

    puts "visible: #{visible}"

    expect(visible).must_equal 1789
  end

  it "finds highest scenic score of all trees" do
    scores = []
    @grid.each_with_index do |i, r, c|
      next if r.zero? || r == @grid.row_size - 1    # top/bottom edge
      next if c.zero? || c == @grid.column_size - 1 # left/right edge

      row = @grid.row(r)
      col = @grid.column(c)

      left, right = row[...c].reverse, row[c + 1...]
      top, bottom = col[...r].reverse, col[r + 1...]

      gte = ->(x){ x >= i }

      left_dist = left.find_index(&gte)
      left_score = left[..left_dist].count

      right_dist = right.find_index(&gte)
      right_score = right[..right_dist].count

      top_dist = top.find_index(&gte)
      top_score = top[..top_dist].count

      bottom_dist = bottom.find_index(&gte)
      bottom_score = bottom[..bottom_dist].count

      score = left_score * right_score * top_score * bottom_score
      scores.push score
    end

    max = scores.max
    puts "max: #{max}"

    expect(max).must_equal 314820
  end
end
