class Player
  attr_reader :name

  def initialize(name)
    @name = name
    @current_turn_score = 0
  end

  def continue?(turn, gamestate)
    if rand(2) == 0 then
      print "I will continue\n"
      true
    else
      print "No more for me\n"
      false
    end
  end

  def you_win(gamestate)
    print "Yaaay I win\n"
  end

  def you_lose(gamestate)
    print "I suck\n"
  end

  def turn_done(turn, gamestate)
    print "My turn is done, thanks\n"
  end

  def new_roll(roll)
    print "Rolling... Heeeeeere I go!\n"
  end

  def new_turn(turn, gamestate)
    @current_turn_score = 0
    print "Ready to play!\n"
  end
end


