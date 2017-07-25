function resetColor()
	love.graphics.setColor(255, 255, 255)
end

function randomBool()
  return (math.random(1,2) == 2)
end

function trimStr(str)
  return str:gsub("%s+", "")
end
