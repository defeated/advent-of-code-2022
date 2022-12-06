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
      line.
        match(/move (?<move>\d+) from (?<from>\d+) to (?<to>\d+)/).
        named_captures.
        transform_keys(&:to_sym).
        transform_values(&:to_i)
    end
  end

  it "moves one crates at a time to different columns per the instructions" do
    @steps.each do |step|
      step[:move].times do
        taken = @crates[step[:from] - 1].shift
        @crates[step[:to] - 1].unshift *taken
      end
    end

    tops = @crates.map(&:first).join
    puts "tops: #{tops}"

    expect(tops).must_equal "FCVRLMVQP"
  end

  it "moves many crates at a time to different columns per the instructions" do
    @steps.each do |step|
      taken = @crates[step[:from] - 1].shift(step[:move])
      @crates[step[:to] - 1].unshift *taken
    end

    tops = @crates.map(&:first).join
    puts "tops: #{tops}"

    expect(tops).must_equal "RWLWGJGFD"
  end
end
