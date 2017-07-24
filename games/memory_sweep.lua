require 'topbar'
require 'tile'

local MemorySweep = Game:addState('MemorySweep')

local TILE_PADDING = 5

local BG_COLOR = {36, 52, 85}
local bgImage = love.graphics.newImage('img/bg/subtle_concrete.png')
local GRID_BG_COLOR = {0, 0, 51}

local MAX_TRIES = 3

function MemorySweep:enteredState(gridH, gridW)
  self.score = 0
  self.triesCount = MAX_TRIES

  self.revealTimer = 0
  self.started = false
  self.finished = false

  self.gridW = gridW
  self.gridH = gridH
  self.grid = {}

  self.topbar = Topbar:new(self)

  self:populateGrid()
end

function MemorySweep:start()
  self.started = true
end

function MemorySweep:stop()
end

function MemorySweep:revealGrid(revealed)
  for _, row in pairs(self.grid) do
    for __, tile in pairs(row) do
      if tile.answerTile then
        tile.revealed = revealed
      end
    end
  end

end

function MemorySweep:populateGrid()
  -- Create only around 30% of tiles as answer tile
  local totalAnswers = math.floor((self.gridH * self.gridW) * 0.30)

  for y = 1, self.gridH do
    self.grid[y] = {}
    for x = 1, self.gridW do
      if totalAnswers > 0 then
        a = randomBool()
        if a then totalAnswers = totalAnswers - 1 end
      else
        a = false
      end
      self.grid[y][x] = Tile:new(a)
    end
  end
end

function MemorySweep:drawBackground()
  -- TODO: Add repeated bg image
  love.graphics.setBackgroundColor(BG_COLOR)
end

function MemorySweep:draw()
  self:drawBackground()

  -- Draw top bar
  self.topbar:draw()

  -- Draw grid
  love.graphics.setColor(GRID_BG_COLOR)
  love.graphics.rectangle('fill', 0, 64, love.graphics.getWidth(),
    (self.gridH * Tile.static.SIZE) + TILE_PADDING * (self.gridH + 1))

  local size = Tile.static.SIZE
  for y, row in pairs(self.grid) do
    for x, tile in pairs(row) do
      tile.x = x * (size + TILE_PADDING)
      tile.y = y * (size + TILE_PADDING)
      tile:drawTile()
    end
  end
end

function MemorySweep:update(dt)
  self.revealTimer = self.revealTimer + dt

  if not self.started then
    if self.revealTimer >= 4 then
      self:revealGrid(false)
      self:start()
    elseif self.revealTimer >= 1 then
      self:revealGrid(true)
    end
  end
end

function MemorySweep:mousepressed(x, y, button, istouch)
  -- use left click
  if self.started and button == 1 then
    -- check which (if any) tile was clicked
    for _, row in pairs(self.grid) do
      for __, tile in pairs(row) do
        if tile:isClicked(x, y) then
          Tile.static.selectTileSound:play()
          tile.revealed = true

          if tile.answerTile then
            self.score = self.score + 1
          else
            self.triesCount = self.triesCount - 1
          end

          -- TODO: Check if this return exits both loops
          return
        end
      end
    end

  end
end
