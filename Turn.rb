class Turn
  attr_reader :score
  attr_reader :lastroll
  attr_reader :dicesleft

  def go
    @dicesleft = @diceset.number_of_dices
    while true
      # we dont let the player actually call diceset.roll to prevent cheap cheating!
      @lastroll = @diceset.roll @dicesleft
  
      roll_result = Score::calc @lastroll
      @lastroll.dices_that_scored = roll_result[:dices_that_scored]
      @lastroll.score = roll_result[:score]
      print "Rolled: #{@lastroll.inspect}\n"
      @dicesleft -= @lastroll.dices_that_scored
      @player.new_roll @lastroll
      @score += @lastroll.score
      break unless yield self
    end
    print "Turn Score: #{@score}\n"
  end

  def initialize(player, playernum, diceset, gamestate)
    @score = 0
    @playernum = playernum
    @diceset = diceset
    @player = player
    @state = gamestate
  end
end


