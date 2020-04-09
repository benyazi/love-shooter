local system = Tiny.processingSystem({
  filter = Tiny.filter('granateMoving&position')})

function system:onAdd(e)

end

local bounceFilter = function(item, other)
  if other.isWall then
    return 'bounce'
  elseif other.isEnemy then
    other.addGranateTouchDamage = item.granateMoving.speed
    -- item.granateMoving.speed = item.granateMoving.speed - 
    World:notifyChange(other)
    return 'bounce'
  end
  -- else return nil
end

function system:process(e,dt)
  if e.granateMoving.lifeTimer > 0 then 
    local rad = e.granateMoving.rad
    local speed = e.granateMoving.speed
    local x, y = e.position.x, e.position.y
    local x2 = x + math.cos(rad) * speed*dt
    local y2 = y + math.sin(rad) * speed*dt
    local finalX, finalY, collisions = World.physics:move(e, x2, y2, bounceFilter)

    local newRad = math.atan2(finalY-y,finalX-x)
    if rad ~= newRad then 
      e.granateMoving.rad = newRad
    end
    e.position.x = finalX
    e.position.y = finalY
    e.granateMoving.lifeTimer = e.granateMoving.lifeTimer - dt
    e.granateMoving.speed = e.granateMoving.speed - 10*dt
    World:notifyChange(e)
  else 
    e.granateMoving = nil
    e.granateExplosion = true
    World:notifyChange(e)
  end
end

return system
