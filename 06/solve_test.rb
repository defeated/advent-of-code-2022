require_relative "../test_helper"

describe "day 06" do
  before do
    @data = File.read(__dir__ + "/data.txt").chomp
  end

  it "finds the start-of-marker in a data stream" do
    skip

    frame = 3
    marker = @data.chars.each_with_index.find do |l, i|
      finish = i + frame
      window = l + @data[i + 1..finish]
      window.chars.size == window.chars.uniq.size
    end

    start = marker.last + frame + 1
    puts "start: #{start}"

    expect(start).must_equal 1300
  end

  it "finds the start-of-message in a data stream" do
    frame = 13
    message = @data.chars.each_with_index.find do |l, i|
      finish = i + frame
      window = l + @data[i + 1..finish]
      window.chars.size == window.chars.uniq.size
    end

    start = message.last + frame + 1
    puts "start: #{start}"

    expect(start).must_equal 3986
  end
end
