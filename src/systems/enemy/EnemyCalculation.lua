local system = Tiny.system({
    filter = Tiny.filter('isEnemy')})

function system:onAdd(e)
    ENEMY_COUNT = ENEMY_COUNT + 1
end
  
function system:onRemove(e)
    ENEMY_COUNT = ENEMY_COUNT - 1
    if ENEMY_COUNT < 1 then
        if GAME_MANAGER.gameOver == nil then 
          GAME_MANAGER.gameOver = true
          GAME_MANAGER.gameOverText = 'win'
          World:notifyChange(GAME_MANAGER)
        end
    end
end

return system