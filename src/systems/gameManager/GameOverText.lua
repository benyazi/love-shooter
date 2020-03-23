local system = Tiny.processingSystem({
    filter = Tiny.filter('gameOver&gameOverText'),
    isDrawGuiSystem = true})
  
function system:process(e)
	love.graphics.setNewFont('assets/PixelNES.otf', 36)
    if e.gameOverText == 'win' then
        love.graphics.setColor(0,1,0)
        love.graphics.print("GAME WIN", WindowWidth/2 - 128, WindowHeight/2)
    else 
        love.graphics.setColor(1,0,0)
        love.graphics.print("GAME OVER", WindowWidth/2 - 128, WindowHeight/2)
    end
	love.graphics.setNewFont('assets/PixelNES.otf', 8)
    love.graphics.setColor(1,1,1)
end

return system