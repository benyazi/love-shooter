local system = Tiny.processingSystem({
  filter = Tiny.filter('isEnemy&!activatedEnemy')})

function system:onAdd(e)

end

local watchPlayerFilter = function(item)
  if item.isPlayer then
    return 'touch'
  end
  -- else return nil
end

function system:process(e)
  local dist = e.watchDistance
  local items, len = World.physics:queryRect(e.position.x - dist/2, e.position.y - dist/2, dist, dist, watchPlayerFilter)
  for k,v in pairs(items) do
    e.activatedEnemy = v
    World:notifyChange(e)
  end
end

return system