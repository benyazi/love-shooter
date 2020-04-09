local Granate = Class{}

function Granate:init(x, y)
    self.size = {w=8,h=8}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.granate, level = 1.5}
    -- self.drawRect = {}
    self.dragable = true
    self.dragGranate = {
        sprite = Assets.granate,
        startSpeed = 0,
        radius = 320,
        storePerOne = 1,
        store = 3,
        lifeTime = 2,
        healthDamage = 5
      }
end

return Granate