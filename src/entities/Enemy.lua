local Enemy = Class{}

function Enemy:init(x, y)
    self.size = {w=64,h=64}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.knight, level = 2}
    self.isEnemy = true
    self.health = 100
end

return Enemy
