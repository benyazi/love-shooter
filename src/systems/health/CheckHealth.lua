local system = Tiny.processingSystem({
  filter = Tiny.filter('health')})

function system:onAdd(e)

end

function system:process(e)
  if e.health < 0 then 
    if e.isPlayer then 
      if GAME_MANAGER.gameOver == nil then 
        GAME_MANAGER.gameOver = true
        GAME_MANAGER.gameOverText = 'lose'
        World:notifyChange(GAME_MANAGER)
      end
    else 
      World:removeEntity(e)
      e = nil
    end
  end
end

return system