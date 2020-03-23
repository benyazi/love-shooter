local Ground = Class{}

function Ground:init(x, y)
    self.size = {w=64,h=64}
    self.position = {x=x,y=y}
    if math.random(0,5) > 4 then 
        self.drawSprite = {sprite = Assets.wall_1, level = 1}
        self.isWall = true
        self.health = 300
    else
        self.drawSprite = {sprite = Assets.ground_1, level = 1}
        self.isGround = true
    end
    self.isVisibled = true
end

return Ground
