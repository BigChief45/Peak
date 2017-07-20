class = require 'lib/middleclass'
require 'utils'
require 'game'

function love.load()
  love.graphics.setBackgroundColor(0, 0, 51)

  -- Start Memory sweep game 5x5
  Ms = Game:new(5, 5)
  Ms:populateGrid()
end

function love.update()
end

function love.draw()
  Ms:draw()
end
