class Roll
  attr_accessor :dices_that_scored
  attr_accessor :score

  def initialize
    @dices = []
    @dices_that_scored = 0
    @score = 0
  end

  def how_many_of_each?
    @dices.inject([0, 0, 0, 0, 0, 0]) {|acc, num| acc[num - 1] += 1; acc }
  end

  def << (num)
    @dices << num
  end
end


