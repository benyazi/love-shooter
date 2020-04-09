local Ammunition = Class{}

function Ammunition:init(x, y)
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.ammunition, level = 1.4}
    -- self.dragable = true
    self.dragAmmunition = {
        count = 20
    }
    self.lootBox = {
      active = false
    }
    self.hadleInput = {
      useAction = {
          scancode = 'space',
          isDown = false
      }
    }
end

return Ammunition