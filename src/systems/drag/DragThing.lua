local system = Tiny.processingSystem({
  filter = Tiny.filter('dragable')})

local dragByPlayerFilter = function(item)
  if item.isPlayer then
    return 'touch'
  end
  -- else return nil
end

function system:process(e)
  local items, len = World.physics:queryPoint(e.position.x, e.position.y, dragByPlayerFilter)
  for k,v in pairs(items) do
    if e.dragWeapon then 
      v.weapon = e.dragWeapon
      World:removeEntity(e)
      e = nil 
      World:notifyChange(v)
    end
  end
end

return system
