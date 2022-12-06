require_relative "../test_helper"
require "csv"

describe "day 05" do
  before do
    top, bottom = File.read(__dir__ + "/data.txt").chomp.split("\n\n")

    top.
      gsub!("    ", ",").   # make sure a missing crate is nil in column
      gsub!(" ", "").       # trim remaining spaces from columns
      gsub!("[", "").       # remove crate walls
      gsub!("]", ",").      # other wall signals end of column
      gsub!(",\n", "\n")    # remove any extra end columns

    data = CSV.parse(top)   # convert string into rows and columns
    data.pop                # remove the crate footer row

    @crates = data.transpose.map(&:compact) # magic
    @steps = bottom.split("\n").map do |line|
      line.match(/move (?<amount>\d+) from (?<source>\d+) to (?<destination>\d+)/)
    end
  end

  it "moves crates one at a time to different columns per the instructions" do
    @steps.each do |step|
      amount = step[:amount].to_i
      source = step[:source].to_i - 1
      destination = step[:destination].to_i - 1

      amount.times do
        taken = @crates[source].shift
        @crates[destination].unshift *taken
      end
    end

    tops = @crates.map(&:first).join
    puts "tops: #{tops}"

    expect(tops).must_equal "FCVRLMVQP"
  end

  it "..." do
    skip
    expect(1).must_equal 0
  end
end
