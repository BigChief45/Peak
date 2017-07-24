require 'menu/menu_button'

local Menu = Game:addState('Menu')

local BG_COLOR = {1, 184, 252}

local GAMES = {
  { 'Memory Sweep', '' },
  { 'Navigation', '' }
}

function Menu:enteredState()
  love.graphics.setBackgroundColor(BG_COLOR)

  self.gameButtons = {}
end

function Menu:draw()
  for y=1, #GAMES do
    local row = GAMES[y]
    for x=1, #row do
      local gameButton = MenuButton:new(row[1], nil, x, y)
      table.insert(self.gameButtons, gameButton)

      gameButton:draw()
    end
  end
end

function Menu:keypressed(key, code)
  if key == 'space' then
    self:gotoState('MemorySweep', math.random(3, 5), math.random(3, 5))
  end
end

function Menu:mousepressed(x, y, button, isTouch)
  if button == 1 then

  end
end
