Tile = class('Tile')

Tile.static.SIZE = 64

function Tile:initialize(answer)
  self.hidden = true

  -- answer means that the tile must be found by the player
  self.answer_tile = answer

  self.x = 0
  self.y = 0
end

function Tile:drawTile(x, y)
  local size = Tile.static.SIZE
  love.graphics.setColor(65, 95, 121) -- grayish blue

  if not self.hidden then
    if self.answer_tile then
      love.graphics.setColor(0, 255, 128) -- green
    else
      -- user mistake
    end
  end

  love.graphics.rectangle('fill', x, y, size, size)

  resetColor()
end
