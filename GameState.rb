class GameState
  attr_reader :who_reached_final_round_score

  def score_for_player(number)
    @scores[number]
  end

  def required_score_to_enter_game
    300
  end

  def required_score_for_final_round
    3000
  end

  def can_enter_game?(points)
    points >= required_score_to_enter_game
  end

  def who_won?
    winner = -1
    maxscore = -1
    @scores.each_index do |index|
        if @scores[index] > maxscore
            winner = index
            maxscore = @scores[index]
        end
    end
    winner
  end

  def final_round_reached?
    !@who_reached_final_round_score.nil?
  end

  def turn_played(playernum, turn)
    if in_game? playernum
      @scores[playernum] += turn.score
    elsif turn.score >= required_score_to_enter_game
      print "Player ##{playernum + 1} is now in the game\n"
      @scores[playernum] += turn.score
      in_game! playernum
    end
    if !final_round_reached? && @scores[playernum] >= required_score_for_final_round
      @who_reached_final_round_score = playernum
    end
  end

  def in_game!(playernum)
    @ingame.push(playernum)
  end

  def in_game?(playernum)
    @ingame.include?(playernum)
  end

  def initialize(playerscount)
    @scores = (1..playerscount).map {|x| 0}
    @ingame = []
    @who_reached_final_round_score = nil
  end
end

