local DeadEnemy = Class{}

function DeadEnemy:init(x, y)
    self.size = {w=48,h=48}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.dead_knight, level = 1.1}
end

return DeadEnemy
