local system = Tiny.processingSystem({
  filter = Tiny.filter('lootBox&lootObjectEvent')})

function system:onAdd(e)

end

function system:process(e,dt)
  local v = e.lootBox.target
  if e.dragWeapon then 
    v.weapon = e.dragWeapon
    World:removeEntity(e)
    e = nil 
    World:notifyChange(v)
  elseif e.dragAmmunition and v.weapon then 
    v.weapon.store = v.weapon.store + e.dragAmmunition.count
    World:removeEntity(e)
    e = nil 
    World:notifyChange(v)
  elseif e.dragPills and v.health then 
    -- print('Get pill')
    -- print(Inspect(v))
    v.health = v.health + e.dragPills.count
    if v.healthMax and v.healthMax < v.health then 
      -- print('Max')
      v.health = v.healthMax
    end
    World:removeEntity(e)
    e = nil 
    World:notifyChange(v)
  elseif e.dragShields and v.shield then 
    v.shield = v.shield + e.dragShields.count
    if v.shieldMax and v.shieldMax < v.shield then 
      v.shield = v.shieldMax
    end
    World:removeEntity(e)
    e = nil 
    World:notifyChange(v)
  end
end

return system
