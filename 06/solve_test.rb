require_relative "../test_helper"

describe "day 06" do
  before do
    @data = File.read(__dir__ + "/data.txt").chomp.chars
  end

  it "finds the start-of-marker in a data stream" do
    frame = 4

    marker = @data.each_cons(frame).find_index do |window|
      window.size == window.uniq.size
    end

    start = marker + frame
    puts "start: #{start}"

    expect(start).must_equal 1300
  end

  it "finds the start-of-message in a data stream" do
    frame = 14

    message = @data.each_cons(frame).find_index do |window|
      window.size == window.uniq.size
    end

    start = message + frame
    puts "start: #{start}"

    expect(start).must_equal 3986
  end
end
