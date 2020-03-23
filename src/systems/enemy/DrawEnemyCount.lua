local system = Tiny.processingSystem({
  filter = Tiny.filter('drawFps'),
  isDrawGuiSystem = true})

function system:process(e)
	love.graphics.setColor(1,0,0)
  love.graphics.print("Enemies: " .. ENEMY_COUNT, 5, 25)
	love.graphics.setColor(1,1,1)
end

return system
