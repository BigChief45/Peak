local GameOver = Game:addState('GameOver')

local BG_COLOR = {36, 52, 85}

local msg

function GameOver:enteredState(gameWon)
  self.gameWon = gameWon

  if gameWon then
    msg = 'Congratulations'
  else
    msg = 'Game Over'
  end
end

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
  love.graphics.print(msg, 225, 180)
  resetFont()

  Suit.draw()
end

function GameOver:keypressed(key, code)
end
