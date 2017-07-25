local Countdown = Game:addState('Countdown')

local BG_COLOR = {255, 255, 255}

local countdown = 4

function Countdown:enteredState()
  love.graphics.setBackgroundColor(BG_COLOR)
end

function Countdown:update(dt)
  countdown = countdown - dt

  if countdown <= 0 then
    -- Returns to the selected game's state
    self:popState('Countdown')
  end
end

function Countdown:draw()
  love.graphics.setColor({1, 184, 252})
  love.graphics.setNewFont(70)
  love.graphics.print(math.floor(countdown), 380, 250)

  love.graphics.setNewFont(18)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print('GET READY', 350, 330)

  resetFont()
end

function Countdown:keypressed(key, code)
end
