local Pills = Class{}

function Pills:init(x, y)
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.pills, level = 1.4}
    -- self.dragable = true
    self.dragPills = {
        count = 2
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

return Pills