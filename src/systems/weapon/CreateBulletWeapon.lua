local system = Tiny.processingSystem({
  filter = Tiny.filter('weapon&createWeaponEvent')})

function system:onAdd(e)

end

function system:process(e)
  local x = e.position.x+24 + math.cos(e.createWeaponEvent.rad) * 32
  local y = e.position.y+24 + math.sin(e.createWeaponEvent.rad) * 32
  local bullet = {
    bullet = {
      rad = e.createWeaponEvent.rad,
      speed = e.createWeaponEvent.speed,
      lifeTimer = e.createWeaponEvent.bulletLifeTime,
      damage = e.createWeaponEvent.damage
    },
    position = {x = x, y = y}
  }
  World:addEntity(bullet)
  e.createWeaponEvent = nil
  World:notifyChange(e)
end

return system
