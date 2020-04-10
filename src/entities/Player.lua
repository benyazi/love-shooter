local Player = Class{}

function Player:init(x, y)
    self.size = {w=48,h=48}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.knight, level = 2}
    self.isPlayer = true
    self.canDrag = true
    self.health = 4
    self.healthMax = 4
    self.shield = 0
    self.shieldMax = 4
    self.faith = {
        current = 0,
        max = 100
    }
end

return Player
