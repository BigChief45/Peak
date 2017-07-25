class = require 'lib/middleclass'
Stateful = require 'lib/stateful'
Suit = require 'lib/suit'

require 'utils'
require 'game'

local game

function love.load()
  love.graphics.setNewFont(15)
  math.randomseed(os.time())

  -- Launch Game starting at Main Menu
  game = Game:new()
end

function love.update(dt)
  game:update(dt)
end

function love.draw()
  game:draw()
end

function love.keypressed(key, code)
  game:keypressed(key, code)
end

function love.mousepressed(x, y, button, istouch)
  game:mousepressed(x, y, button, istouch)
end
