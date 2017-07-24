class = require 'lib/middleclass'
require 'utils'
require 'game'

function love.load()
  love.graphics.setNewFont(15)
  math.randomseed(os.time())
  love.graphics.setBackgroundColor(36, 52, 85)

  -- Start Memory sweep game (height x width)
  Ms = Game:new(math.random(3, 5), math.random(3, 5))
end

function love.update(dt)
  Ms:update(dt)
end

function love.draw()
  Ms:draw()
end
