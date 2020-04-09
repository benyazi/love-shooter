local system = Tiny.processingSystem({
  filter = Tiny.filter('enemyDieEvent')
})

function system:process(e)
  local curX, curY = e.position.x, e.position.y
  World:removeEntity(e)
  e = nil
  World:addEntity(Entities.DeadEnemy(curX, curY))
end

return system