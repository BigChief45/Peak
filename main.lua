class = require 'lib/middleclass'
require 'utils'
require 'game'

function love.load()
  love.graphics.setBackgroundColor(0, 0, 51)

  -- Start Memory sweep game 5x5
  Ms = Game:new(5, 5)
  Ms:start()
end

function love.update(dt)
  Ms.revealCooldown = Ms.revealCooldown + dt

  if Ms.revealCooldown >= 4 then
    Ms:revealGrid(false)
  elseif Ms.revealCooldown >= 1 then
    Ms:revealGrid(true)
  end
end

function love.draw()
  Ms:draw()
end
