local system = Tiny.processingSystem({
  filter = Tiny.filter('granate&position')})

function system:onAdd(e)

end

function system:process(e,dt)
  if e.granate.store <= 0 then 
    return
  end

  if love.mouse.isDown(2) then
    e.granate.startSpeed = e.granate.startSpeed + 500*dt
    World:notifyChange(e)
  else 
    if e.granate.startSpeed > 0 then 
      local granate = Entities.weapon.Granate(e.position.x+16, e.position.y+16)
      granate.dragable = nil 

      local cameraX,cameraY = love.mouse.getPosition()
      local worldX, worldY = Camera:worldCoords(cameraX,cameraY)
      local rad = math.atan2(worldY-e.position.y,worldX-e.position.x)
      granate.granateMoving = {
        rad = rad,
        speed = e.granate.startSpeed,
        lifeTimer = e.granate.lifeTime
      }
      World:addEntity(granate)
      e.granate.startSpeed = 0
      e.granate.store = e.granate.store - 1
      World:notifyChange(e)
    end
  end
end

return system
