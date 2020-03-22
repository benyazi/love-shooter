local system = Tiny.processingSystem({
  filter = Tiny.filter('bullet&position')})

function system:onAdd(e)

end

local enemyFilter = function(item)
  if item.isEnemy then
    return 'touch'
  end
  -- else return nil
end

function system:process(e,dt)
  local items, len = World.physics:queryPoint(e.position.x, e.position.y, enemyFilter)
  local touched = false
  for k,v in pairs(items) do
    if v.health then 
      v.health = v.health - e.bullet.damage
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