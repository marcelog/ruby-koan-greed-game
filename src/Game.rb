class Game
  attr_reader :scores
  def player_turn(playernum, player)
    print "Player ##{playernum + 1}: #{player.name} turn\n"
    turn = Turn.new player, playernum, @diceset, @state
    player.new_turn turn, @state
    playerscore = @state.score_for_player(playernum)
    turn.go do |turn|
      roll = turn.lastroll
      totalscore = playerscore + turn.score + roll.score
      true unless
        totalscore >= @state.required_score_for_final_round or
        roll.score == 0 or
        turn.dicesleft == 0 or
        !player.continue? turn, @state
    end
    @state.turn_played playernum, turn
    player.turn_done turn, @state
  end

  def new_round
    @players.each_with_index do |player, index|
      if @state.final_round_reached?
        if @state.who_reached_final_round_score == index
            next
        end
      end
      print "-------------\n"
      player_turn index, player
      print "New game state: #{@state.inspect}\n"
    end
  end

  def go
    while !@state.final_round_reached?
      new_round
    end
    finish_game
  end

  def finish_game
    print "-------------\n"
    print "Last round!\n"
    new_round
    winnernum = @state.who_won?
    player = @players[winnernum]
    maxscore = @state.score_for_player winnernum
    print "-------------\n"
    print "Player ##{winnernum + 1}: #{player.name} wins with score #{maxscore}\n"
    player.you_win @state
  end

  def initialize(players)
    @players = players
    @diceset = DiceSet.new 5
    @state = GameState.new players.count
  end
end


