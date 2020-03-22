local system = Tiny.processingSystem({
  filter = Tiny.filter('health&position'),
  isDrawSystem = true})

function system:process(e)
  love.graphics.setColor(1,0,0)
  love.graphics.print('health: ' .. e.health, e.position.x, e.position.y - 32)
  -- return default color
  love.graphics.setColor(0,0,0)
end

return system
