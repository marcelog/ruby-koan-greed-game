class Score
  class << self
    def score_per_single_of
      [100, 0, 0, 0, 50, 0]
    end

    def score_mul_per_three_of
      [1000, 100, 100, 100, 100, 100]
    end

    def how_much_for_single?(num)
      score_per_single_of[num - 1]
    end

    def how_much_for_3?(num)
      score_mul_per_three_of[num - 1] * num
    end
  
    def score_per_n_of(num, n)
      score = 0
      totaldices = 0
      if n >= 3
        score += how_much_for_3? num
        n -= 3
        totaldices += 3
      end
      score += how_much_for_single?(num) * n
      totaldices += n unless score == 0
      return score, totaldices
    end

    def calc(roll)
      dicecount = roll.how_many_of_each?
      state = {:score => 0, :dices_that_scored => 0}
      dicecount.each_index.inject(state) do |state, index|
        score,dices_that_scored = score_per_n_of index+1, dicecount[index]
        state[:score] += score
        state[:dices_that_scored] += dices_that_scored
        state
      end
      state
    end
  end
end


