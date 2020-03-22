local Ground = Class{}

function Ground:init(x, y)
    self.size = {w=32,h=32}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.ground_1, level = 1}
    self.isGround = true
    self.isVisibled = true
end

return Ground
