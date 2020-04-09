local Explosion = Class{}

function Explosion:init(x, y)
    self.size = {w=16,h=16}
    self.position = {x=x,y=y}
    local g = Anim8.newGrid(16,16,Assets.explosion:getWidth(),Assets.explosion:getHeight())
    local animation = Anim8.newAnimation(g('1-4',2),0.25)
    self.drawSprite = {
      sprite = Assets.explosion, 
      animation = animation,
      level = 1.5,
      scale = {x = 4, y = 4}
    }
    self.removeTimer = 1
end

return Explosion