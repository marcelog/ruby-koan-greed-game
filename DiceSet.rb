class DiceSet
  attr_reader :number_of_dices

  def rollall
    roll @number_of_dices
  end

  def roll number_of_dices
    (1..number_of_dices).inject(Roll.new) do |roll, x|
      roll << rand(6) + 1
      roll
    end
  end

  def initialize(number_of_dices)
    @number_of_dices = number_of_dices
  end
end


