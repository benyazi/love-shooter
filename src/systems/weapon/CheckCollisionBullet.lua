local system = Tiny.processingSystem({
  filter = Tiny.filter('bullet&position')})

function system:onAdd(e)

end

local enemyFilter = function(item)
  if item.health then
    return 'touch'
  end
  -- else return nil
end

function system:process(e,dt)
  if e.bullet.damageTimer > 0 then 
    e.bullet.damageTimer = e.bullet.damageTimer - dt
    return
  end
  local items, len = World.physics:queryPoint(e.position.x, e.position.y, enemyFilter)
  local touched = false
  for k,v in pairs(items) do
    if v.health then 
      local dmg = e.bullet.damage
      if v.shield and v.shield > 0 then 
        if v.shield >= dmg then 
          v.shield = v.shield - dmg
        else 
          dmg = dmg - v.shield
          v.shield = 0
        end
      end
      v.health = v.health - dmg
      touched = true
      World:notifyChange(v)
    end
  end
  if touched then 
    World:removeEntity(e)
    e = nil
  end
end

return system
