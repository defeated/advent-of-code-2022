require "minitest/autorun"
require "matrix"

#
#                             PLAYER 2 (elf)
#                 -----------------------------------------
#                 |           | rock  | paper | scissors  |
#                 -----------------------------------------
#                 | rock      | draw  | loss  | win       |
#                 -----------------------------------------
# PLAYER 1 (me)   | paper     | win   | draw  | loss      |
#                 -----------------------------------------
#                 | scissors  | loss  | win   | draw      |
#                 -----------------------------------------
#
KEYS = [
  :rock,
  :paper,
  :scissors
]
RULES = Matrix[
  [:draw, :loss, :win],
  [:win,  :draw, :loss],
  [:loss, :win,  :draw],
]
POINTS = {
  rock:     1,
  paper:    2,
  scissors: 3,
}
SCORES = {
  win:  6,
  loss: 0,
  draw: 3,
}
CODES = {
  "A" => :rock,
  "B" => :paper,
  "C" => :scissors,
}

describe "day 02" do
  before do
    @data = File.readlines("data.txt", chomp: true).map!(&:split)
  end

  it "calculates my total score by playing the specified shape" do
    CODES.merge! "X" => :rock, "Y" => :paper, "Z" => :scissors

    score = @data.sum(0) do |(elf, me)|
      my_shape, elf_shape = CODES[me], CODES[elf]

      result = RULES[
        KEYS.index(my_shape),
        KEYS.index(elf_shape)
      ]

      SCORES[result] + POINTS[my_shape]
    end

    puts "score: #{score}"
    expect(score).must_equal 13446
  end

  it "calculates my total score by determing the right shapes to play" do
    CODES.merge! "X" => :loss, "Y" => :draw, "Z" => :win

    score = @data.sum(0) do |(elf, me)|
      my_result, elf_shape = CODES[me], CODES[elf]

      my_shape = KEYS[RULES.column(KEYS.index(elf_shape)).to_a.index(my_result)]

      result = RULES[
        KEYS.index(my_shape),
        KEYS.index(elf_shape)
      ]

      SCORES[result] + POINTS[my_shape]
    end

    puts "score: #{score}"
    expect(score).must_equal 13509
  end
end
