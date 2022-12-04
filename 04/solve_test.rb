require_relative "../test_helper"

describe "day 04" do
  before do
    @data = File.readlines(__dir__ + "/data.txt", chomp: true)
  end

  it "counts the total overlaps in elf cleaning schedules" do
    teams = @data.map do |line|
      line.split(",")
    end

    ranges = teams.map do |team|
      team.map { |team| Range.new(*team.split("-")).to_a }
    end

    duplicates = ranges.count do |(first, last)|
      first.difference(last).empty? ||
      last.difference(first).empty?
    end

    puts "duplicates: #{duplicates}"
    expect(duplicates).must_equal 556
  end
end
