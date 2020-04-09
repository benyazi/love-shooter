local system = Tiny.processingSystem({
  filter = Tiny.filter('weapon&createWeaponEvent')})

function system:onAdd(e)

end

function system:process(e)
  local x = e.position.x+24 + math.cos(e.createWeaponEvent.rad) * 32
  local y = e.position.y+24 + math.sin(e.createWeaponEvent.rad) * 32
  if e.createWeaponEvent.weaponData.bulletCount and e.createWeaponEvent.weaponData.bulletCount > 1 then 
    local startRad = e.createWeaponEvent.rad - e.createWeaponEvent.weaponData.scatter/2
    local stepRad = e.createWeaponEvent.weaponData.scatter/e.createWeaponEvent.weaponData.bulletCount
    for i=1,e.createWeaponEvent.weaponData.bulletCount do
      local bullet = Entities.weapon.Bullet1(x,y)
      bullet.bullet = {
        rad = startRad + stepRad*i,
        weaponData = e.createWeaponEvent.weaponData,
        speed = e.createWeaponEvent.speed,
        lifeTimer = e.createWeaponEvent.bulletLifeTime,
        damage = e.createWeaponEvent.damage,
        damageTimer = 0.05
      }
      World:addEntity(bullet)
    end
  else
    local bullet = Entities.weapon.Bullet1(x,y)
    bullet.bullet = {
        rad = e.createWeaponEvent.rad,
        weaponData = e.createWeaponEvent.weaponData,
        speed = e.createWeaponEvent.speed,
        lifeTimer = e.createWeaponEvent.bulletLifeTime,
        damage = e.createWeaponEvent.damage,
        damageTimer = 0.05
      }
    World:addEntity(bullet)
  end
  e.createWeaponEvent = nil
  World:notifyChange(e)
end

return system
