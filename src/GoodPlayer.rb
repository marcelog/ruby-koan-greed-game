class GoodPlayer < Player

    def initialize(name, num)
        super name
        @imingame = false
        @num = num
    end

    def continue?(turn, state)
      can_enter_game = state.can_enter_game?(turn.score)
      case
        when !@imingame && can_enter_game
          print "I'm in the game, so I'll leave this here\n"
          false
        when !@imingame && !can_enter_game
          print "I will try to get in the game\n"
          true
        when turn.dicesleft > 2
          print "Got enough dices, let's try my luck\n"
          true
        else
          print "Kaachink!\n"
          false
      end
    end
end

