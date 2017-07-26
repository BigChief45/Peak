Game = class('Game'):include(Stateful)

require 'menu/menu'
require 'games/states/pause'
require 'games/states/game_over'

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
  -- Pause game
  if key == 'p' then
    self:pushState('Pause')
  end
end

function Game:mousepressed(x, y, button, isTouch)
end
