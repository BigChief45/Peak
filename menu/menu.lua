require 'games/states/countdown'

local Menu = Game:addState('Menu')

local BG_COLOR = {1, 184, 252}

-- Button colors
Suit.theme.color = {
    normal  = { bg = {255, 255, 255}, fg = {0, 0, 0 } },
    hovered = { bg = {255, 165, 0}, fg = {255, 255, 255} },
    active  = { bg = {255, 165, 0}, fg = {225, 225, 225} }
}

local GAMES = {
  'Memory Sweep',
  'Navigation'
}

function Menu:enteredState()
  love.graphics.setBackgroundColor(BG_COLOR)
end

function Menu:update(dt)
  Suit.layout:reset(250, 150)
  Suit.layout:padding(10, 10)

  for i=1, #GAMES do
    if Suit.Button(GAMES[i], Suit.layout:row(300, 80)).hit then
      self:gotoState(trimStr(GAMES[i]))
    end
  end
end

function Menu:draw()
  -- Draw title
  love.graphics.setNewFont(70)
  love.graphics.print('Peak', 325, 10)

  love.graphics.setNewFont(15)
  Suit.draw()
end

function Menu:keypressed(key, code)
end
