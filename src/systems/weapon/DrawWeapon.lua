local system = Tiny.processingSystem({
  filter = Tiny.filter('weapon&position&size'),
  isDrawSystem = true})

function system:process(e)
  local x,y = e.position.x+24, e.position.y+24 
  local cameraX,cameraY = love.mouse.getPosition()
  local worldX, worldY = Camera:worldCoords(cameraX,cameraY)
  local rad = math.atan2(worldY-y,worldX-x)
  local flip = 1
  if rad > math.pi/2 and rad < (math.pi*3)/2 then 
    flip = -1
  end 
  local rad2 = rad - math.pi/2
  local x2 = x + math.cos(rad2) * 16
  local y2 = y + math.sin(rad2) * 16

  love.graphics.setColor(1,1,1)
  -- love.graphics.line(x, y, worldX, worldY)
  love.graphics.draw(e.weapon.sprite, x2,y2, rad, 1, 1)

  love.graphics.setColor(1,0,0)
  love.graphics.print('Store: ' .. e.weapon.store .. ', reload: ' .. e.weapon.reloadTimer, e.position.x, e.position.y - 20)
  -- return default color
  love.graphics.setColor(1,1,1)
end

return system
