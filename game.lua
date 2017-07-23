require 'tile'

Game = class('Game')

local TILE_PADDING = 5

local BG_COLOR = {36, 52, 85}
local bgImage = love.graphics.newImage('img/bg/subtle_concrete.png')

function Game:initialize(gridH, gridW)
  self.score = 0
  self.revealTimer = 0
  self.started = false

  self.gridW = gridW
  self.gridH = gridH
  self.grid = {}

  self:populateGrid()
end

function Game:start()
  self.started = true
end

function Game:stop()
end

function Game:revealGrid(revealed)
  for _, row in pairs(self.grid) do
    for __, tile in pairs(row) do
      if tile.answerTile then
        tile.revealed = revealed
      end
    end
  end

end

function Game:populateGrid()
  for x = 1, self.gridW do
    self.grid[x] = {}
    for y = 1, self.gridH do
      self.grid[x][y] = Tile:new(randomBool())
    end
  end
end

function Game:drawBackground()
  -- TODO: Make bg repeat
  love.graphics.setColor(BG_COLOR)
  love.graphics.draw(bgImage, 0, 0)
end

function Game:draw()
  -- Draw top bar

  -- Draw grid
  local size = Tile.static.SIZE
  for y, row in pairs(self.grid) do
    for x, tile in pairs(row) do
      tile.x = x * (size + TILE_PADDING)
      tile.y = y * (size + TILE_PADDING)
      tile:drawTile()
    end
  end
end

function love.mousepressed(x, y, button, istouch)
  -- use left click
  if Ms.started and button == 1 then
    -- check which (if any) tile was clicked
    for _, row in pairs(Ms.grid) do
      for __, tile in pairs(row) do
        if tile:isClicked(x, y) then
          Tile.static.selectTileSound:play()
          tile.revealed = true
          -- TODO: Check if this return exits both loops
          return
        end
      end
    end

  end
end
