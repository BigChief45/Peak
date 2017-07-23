class = require 'lib/middleclass'
require 'utils'
require 'game'

function love.load()
  love.graphics.setBackgroundColor(0, 0, 51)

  -- Start Memory sweep game 5x5
  Ms = Game:new(5, 5)
end

function love.update(dt)
  Ms.revealTimer = Ms.revealTimer + dt

  if Ms.revealTimer >= 4 then
    Ms:revealGrid(false)
    Ms:start()
  elseif Ms.revealTimer >= 1 then
    Ms:revealGrid(true)
  end
end

function love.draw()
  Ms:draw()
end
