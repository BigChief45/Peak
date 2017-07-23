Topbar = class('Topbar')

local BG_COLOR = {0, 0, 51}
local SCORE_COLOR = {255, 223, 0}

function Topbar:initialize(game)
  self.game = game
end

function Topbar:draw()
  love.graphics.setColor(BG_COLOR)
  love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), 50)
  resetColor()

  love.graphics.print('Score: ', 20, 15, 0, 1, 1)

  love.graphics.setColor(SCORE_COLOR)
  love.graphics.print(self.game.score, 75, 15, 0, 1, 1)
end
