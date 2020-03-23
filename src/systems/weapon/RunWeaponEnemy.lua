local system = Tiny.processingSystem({
  filter = Tiny.filter('weapon&isEnemy&activatedEnemy')})

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
  if e.weapon.store > 0 then 
    e.weapon.reloadTimer = e.weapon.reloadTime
    -- e.weapon.store = e.weapon.store - e.weapon.storePerOne
    local rad = e.enemyWeapon.rad
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
