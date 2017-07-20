require 'tile'

Game = class('Game')

local TILE_PADDING = 5

function Game:initialize(gridH, gridW)
  self.score = 0

  self.gridW = gridW
  self.gridH = gridH
  self.grid = {}

  self:populateGrid()
end

function Game:start()
end

function Game:stop()
end

function Game:populateGrid()
  for x = 1, self.gridW do
    self.grid[x] = {}
    for y = 1, self.gridH do
      self.grid[x][y] = Tile:new(randomBool())
    end
  end
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
  if button == 1 then
    -- check which (if any) tile was clicked
    for _, row in pairs(Ms.grid) do
      for __, tile in pairs(row) do
        if tile:isClicked(x, y) then
          tile.hidden = false
          -- TODO: Check if this return exits both loops
          return
        end
      end
    end

  end
end

--require 'games/memory_sweep'
