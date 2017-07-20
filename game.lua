require 'tile'

Game = class('Game')

local PADDING = 5 -- Padding between tiles

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
  local size = Tile.static.SIZE
  for y, row in pairs(self.grid) do
    for x, tile in pairs(row) do
      tile.x = x * (size + PADDING)
      tile.y = y * (size + PADDING)
      tile:drawTile()
    end
  end
end

--require 'games/memory_sweep'
