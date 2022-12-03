require "minitest/autorun"

TYPES = ("a".."z").to_a + ("A".."Z").to_a

describe "day 03" do
  before do
    @data = File.readlines("data.txt", chomp: true)
  end

  it "calculates the totals of duplicate items in each rucksack" do
    duplicates = @data.flat_map do |line|
      half = line.size / 2
      line[...half].chars.intersection(line[half..].chars)
    end
    pp "duplicates: ", duplicates

    priorities = duplicates.map { |char| TYPES.index(char) + 1 }
    pp "priorities: ", priorities

    total = priorities.sum
    puts "total: #{total}"

    expect(total).must_equal 8153
  end

  it "calculates the totals of badges in a team rucksack" do
    teams = @data.each_slice(3).to_a
    pp "teams: ", teams

    duplicates = teams.flat_map do |team|
      team.map!(&:chars).shift.intersection(*team)
    end
    pp "duplicates: ", duplicates

    priorities = duplicates.map { |char| TYPES.index(char) + 1 }
    pp "priorities: ", priorities

    total = priorities.sum
    puts "total: #{total}"

    expect(total).must_equal 2342
  end
end
