Tile = class('Tile')

Tile.static.SIZE = 64
local CORRECT_COLOR = {0, 255, 128}
local HIDDEN_COLOR = {65, 95, 121}
local MISTAKE_COLOR = {214, 6, 72}

function Tile:initialize(answer)
  self.revealed = false

  -- answer means that the tile must be found by the player
  self.answerTile = answer

  self.x = 0
  self.y = 0
end

function Tile:drawTile()
  local size = Tile.static.SIZE
  love.graphics.setColor(HIDDEN_COLOR) -- grayish blue

  if self.revealed then
    if self.answerTile then
      love.graphics.setColor(CORRECT_COLOR) -- green
    else
      love.graphics.setColor(MISTAKE_COLOR) -- red
    end
  end

  love.graphics.rectangle('fill', self.x, self.y, size, size)

  resetColor()
end

function Tile:isClicked(mouseX, mouseY)
  return (
    mouseX > self.x and mouseX < (self.x + Tile.static.SIZE)
    and mouseY > self.y and mouseY < (self.y + Tile.static.SIZE)
  )
end
