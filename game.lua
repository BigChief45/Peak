Game = class('Game'):include(Stateful)

require 'menu'
require 'games/memory_sweep'

function Game:initialize()
  self:gotoState('Menu')
end

function Game:exit()
end

function Game:update(dt)
end

function Game:draw()
end

function Game:keypressed(key, code)
end

function Game:mousepressed(x, y, button, isTouch)
end
