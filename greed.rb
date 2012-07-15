dir = File.expand_path(File.dirname(__FILE__)) + '/src/'
require dir + 'DiceSet'
require dir + 'Roll'
require dir + 'Player'
require dir + 'GoodPlayer'
require dir + 'Score'
require dir + 'Turn'
require dir + 'GameState'
require dir + 'Game'

p1 = GoodPlayer.new "P1", 1
p2 = GoodPlayer.new "P2", 2
game = Game.new [p1, p2]
game.go

