local system = Tiny.processingSystem({
  filter = Tiny.filter('health&position&isPlayer'),
  isDrawGuiSystem = true})

function system:process(e)
  local max = e.healthMax
  local cur = e.health
  local percent = cur/(max/100) 

  love.graphics.setColor(1,0,0)
  love.graphics.rectangle('line', 15, 15, 100, 15)
  love.graphics.rectangle('fill', 15, 15, percent, 15)
  -- love.graphics.print('health: ' .. e.health, e.position.x, e.position.y - 32)
  -- return default color
  love.graphics.setColor(0,0,0)

  if e.shield then 
    local max = e.shieldMax
    local cur = e.shield
    local percent = cur/(max/100) 
    love.graphics.setColor(0,0,1)
    love.graphics.rectangle('line', 15, 45, 100, 15)
    love.graphics.rectangle('fill', 15, 45, percent, 15)
    -- love.graphics.print('health: ' .. e.health, e.position.x, e.position.y - 32)
    -- return default color
    love.graphics.setColor(0,0,0)
  end
end

return system
