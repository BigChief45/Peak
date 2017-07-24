MenuButton = class('MenuButton')

local BUTTON_X = 150
local GAME_ITEM_HEIGHT = 80

function MenuButton:initialize(title, image, x, y)
  self.title = title
  self.image = image

  self.x = x
  self.y = y

  self.clicked = false
end

function MenuButton:draw()
  -- Draw button bg
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle('fill', BUTTON_X, self.y * 100, 500, 80, 5, 5)

  love.graphics.setColor(0, 0, 0)
  love.graphics.print(self.title, BUTTON_X + 100, self.y * 110)
end

function MenuButton:isClicked(mouseX, mouseY)
  return (
    mouseX > self.x and mouseX < (self.x + Tile.static.SIZE)
    and mouseY > self.y and mouseY < (self.y + Tile.static.SIZE)
  )
end
