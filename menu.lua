local Menu = Game:addState('Menu')

local BG_COLOR = {1, 184, 252}

function Menu:enteredState()
  love.graphics.setBackgroundColor(BG_COLOR)
end

function Menu:draw()
  love.graphics.print('Press SPACE BAR to play Memory Sweep', 50, 50)
end

function Menu:keypressed(key, code)
  if key == 'space' then
    self:gotoState('MemorySweep', math.random(3, 5), math.random(3, 5))
  end
end
