local system = Tiny.processingSystem({
  filter = Tiny.filter('weapon')})

function system:onAdd(e)

end

function system:process(e,dt)
  if e.weapon.reloadTimer > 0 then 
    e.weapon.reloadTimer = e.weapon.reloadTimer - dt
    if e.weapon.reloadTimer < 0 then 
      e.weapon.reloadTimer = 0
    end
    World:notifyChange(e)
    return
  end
  if love.mouse.isDown(1) and e.weapon.store > 0 then 
    e.weapon.reloadTimer = e.weapon.reloadTime
    e.weapon.store = e.weapon.store - e.weapon.storePerOne
    local cameraX,cameraY = love.mouse.getPosition()
    local worldX, worldY = Camera:worldCoords(cameraX,cameraY)
    local rad = math.atan2(worldY-e.position.y,worldX-e.position.x)
    e.createWeaponEvent = {
      rad = rad,
      weaponData = e.weapon,
      speed = e.weapon.bulletSpeed,
      bulletLifeTime = e.weapon.bulletLifeTime,
      damage = e.weapon.healthDamage
    }
    World:notifyChange(e)
  end
end

return system
