local system = Tiny.processingSystem({
  filter = Tiny.filter('addGranateTouchDamage&health')})

function system:onAdd(e)

end

function system:process(e,dt)
  -- e.health = e.health - 1
  e.addGranateTouchDamage = nil
  World:notifyChange(e)
end

return system
