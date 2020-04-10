local Shield = Class{}

function Shield:init(x, y)
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.shield, level = 1.4}
    -- self.dragable = true
    self.dragShields = {
        count = 1
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

return Shield