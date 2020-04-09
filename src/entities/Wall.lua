local Wall = Class{}

function Wall:init(x, y)
    self.size = {w=64,h=64}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.wall_1, level = 1.1}
    self.isWall = true
    self.health = 10
    self.isVisibled = true
end

return Wall
