local Bullet1 = Class{}

function Bullet1:init(x, y)
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.bullet, level = 1.5}
end

return Bullet1