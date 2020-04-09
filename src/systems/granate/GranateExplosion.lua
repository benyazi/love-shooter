local system = Tiny.processingSystem({
  filter = Tiny.filter('granateExplosion&position')})

function system:onAdd(e)

end

local explosionFilter = function(item)
  if item.isWall and item.health then
    return 'touch'
  elseif item.isEnemy and item.health then
    return 'touch'
  end
  -- else return nil
end

function system:process(e,dt)
  local items, len = World.physics:queryRect(e.position.x+e.size.w/2-e.dragGranate.radius/2, e.position.y+e.size.h/2-e.dragGranate.radius/2, 
    e.dragGranate.radius, e.dragGranate.radius, explosionFilter)
  for k,v in pairs(items) do
    v.health = v.health - e.dragGranate.healthDamage
    World:notifyChange(v)
  end
  local explosion = Entities.weapon.Explosion(e.position.x,e.position.y)
  World:addEntity(explosion)
  World:removeEntity(e)
  e = nil
end

return system
