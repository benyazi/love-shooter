local system = Tiny.processingSystem({
  filter = Tiny.filter('health')})

function system:onAdd(e)

end

function system:process(e)
  if e.health < 0 then 
    if e.isPlayer then 
    else 
      World:removeEntity(e)
      e = nil
    end
  end
end

return system