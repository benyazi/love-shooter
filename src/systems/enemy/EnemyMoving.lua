local system = Tiny.processingSystem({
    filter = Tiny.filter('enemyMoving&position')})
  
  function system:onAdd(e)
  
  end
  
  local enemyMovingFilter = function(item, other)
    if other.isWall then
      return 'slide'
    end
    -- else return nil
  end
  
  function system:process(e, dt)
    if e.enemyMoving.changeTimer <= 0 then 
      e.enemyMoving.changeTimer = math.random(3,5)
      e.enemyMoving.rad = math.random( 0,2*math.pi )
    else
      e.enemyMoving.changeTimer = e.enemyMoving.changeTimer - dt
    end
    local speed = e.enemyMoving.speed

    local rad = e.enemyMoving.rad
    local curX,curY = e.position.x, e.position.y
    if e.activatedEnemy ~= nil then 
      speed = speed * 2
      local tarX, tarY = e.activatedEnemy.position.x, e.activatedEnemy.position.y
      rad = math.atan2(tarY-curY,tarX-curX)
    end
    
    local x = curX + math.cos(rad) * speed * dt
    local y = curY + math.sin(rad) * speed * dt

    local finalX, finalY, collisions = World.physics:move(e, x, y, enemyMovingFilter)
    e.position.x = finalX
    e.position.y = finalY
    World:notifyChange(e)
  end
  
  return system