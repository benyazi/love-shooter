local system = Tiny.processingSystem({
  filter = Tiny.filter('health')})

function system:onAdd(e)

end

function system:process(e)
  if e.health < 0 then 
    World:removeEntity(e)
    e = nil
  end
end

return system
