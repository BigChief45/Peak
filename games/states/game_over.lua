local GameOver = Game:addState('GameOver')

local BG_COLOR = {36, 52, 85}

function GameOver:update()
  Suit.layout:reset(245, 260)
  Suit.layout:padding(10, 10)

  if Suit.Button('Back to Menu', Suit.layout:row(300, 30)).hit then
    self:gotoState('Menu')
  end
end

function GameOver:draw()
  love.graphics.setBackgroundColor(BG_COLOR)

  resetColor()
  love.graphics.setNewFont(60)
  love.graphics.print('Game Over', 225, 180)
  resetFont()

  Suit.draw()
end
