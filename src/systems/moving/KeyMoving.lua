local system = Tiny.processingSystem({
    filter = Tiny.filter('keyMoving&position')})
  
  function system:onAdd(e)
  
  end
  
  local movingFilter = function(item, other)
    if other.isWall then
      return 'slide'
    end
    -- else return nil
  end
  
  function system:process(e, dt)
    local xvel = 0
    local speed = e.keyMoving.speed
    if love.keyboard.isScancodeDown('lshift') then
      speed = speed*2
    end
    if love.keyboard.isScancodeDown('a') then
          xvel = -speed * 100 * dt
       end
       if love.keyboard.isScancodeDown('d') then
          xvel = speed * 100 * dt
       end
      local yvel = 0
      if love.keyboard.isScancodeDown('w') then
            yvel = -speed * 100 * dt
         end
         if love.keyboard.isScancodeDown('s') then
            yvel = speed * 100 * dt
         end
    if xvel == 0 and yvel == 0 then
      return
    end
    if xvel ~= 0 and yvel ~= 0 then
      xvel = xvel/1.3
      yvel = yvel/1.3
    end
    local finalX, finalY, collisions = World.physics:move(e, e.position.x + xvel, e.position.y + yvel, movingFilter)
    e.position.x = finalX
    e.position.y = finalY
    World:notifyChange(e)
  end
  
  return system