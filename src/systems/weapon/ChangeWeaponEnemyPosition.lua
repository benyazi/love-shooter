local system = Tiny.processingSystem({
  filter = Tiny.filter('enemyWeapon&isEnemy&activatedEnemy')})

function system:onAdd(e)

end

function system:process(e,dt)
  if e.activatedEnemy == nil then 
    return 
  end
  local x,y = e.position.x, e.position.y
  local playerX, playerY = e.activatedEnemy.position.x, e.activatedEnemy.position.y
  e.enemyWeapon.rad = math.atan2(playerY-y,playerX-x)

  -- if e.enemyWeapon.changePositionTimer > 0 then 
  --   e.enemyWeapon.changePositionTimer = e.enemyWeapon.changePositionTimer - dt
  --   if e.enemyWeapon.changePositionTimer < 0 then 
  --     e.enemyWeapon.changePositionTimer = 0
  --   end
  -- else 
  --   e.enemyWeapon.changePositionTimer = math.random(2,5)
  --   e.enemyWeapon.rad = math.random( 0, 2*math.pi )
  -- end
  World:notifyChange(e)
end

return system
