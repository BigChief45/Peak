local Pause = Game:addState('Pause')

local BG_COLOR = {36, 52, 85}

function Pause:enteredState()
end

function Pause:exitedState()
end

function Pause:draw()
  love.graphics.setBackgroundColor(BG_COLOR)

  love.graphics.setColor(0, 0, 51, 100)
  love.graphics.rectangle('fill', 350, 200, 200, 50)

  love.graphics.setColor(255, 223, 0)
  love.graphics.printf('GAME PAUSED', 350, 220, 200, 'center')

  resetColor()
end

function Pause:keypressed(key, code)
  if key == 'p' then
    self:popState('Pause')
  end
end
