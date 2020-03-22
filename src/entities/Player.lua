local Player = Class{}

function Player:init(x, y)
    self.size = {w=64,h=64}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.knight, level = 2}
    self.isPlayer = true
end

return Player
