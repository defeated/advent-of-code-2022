require_relative "../test_helper"

describe "day 04" do
  before do
    @data = File.readlines(__dir__ + "/data.txt", chomp: true)
    @data.map! { |line| line.split(",") }
    @data.map! do |teams|
      teams.map { |team| Range.new(*team.split("-")).to_a }
    end
  end

  it "counts the total overlaps in elf cleaning schedules" do
    duplicates = @data.count do |(first, last)|
      first.difference(last).empty? ||
      last.difference(first).empty?
    end

    puts "duplicates: #{duplicates}"
    expect(duplicates).must_equal 556
  end

  it "counts the partial overlaps in elf cleaning schedules" do
    duplicates = @data.count do |(first, last)|
      first.intersection(last).any?
    end

    puts "duplicates: #{duplicates}"
    expect(duplicates).must_equal 876
  end
end
