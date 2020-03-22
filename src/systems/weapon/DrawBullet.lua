local system = Tiny.processingSystem({
  filter = Tiny.filter('bullet&position'),
  isDrawSystem = true})

function system:process(e)
  love.graphics.setColor(1,1,1)
  love.graphics.rectangle('fill', e.position.x, e.position.y, 2, 2)
  -- return default color
  love.graphics.setColor(1,1,1)
end

return system
