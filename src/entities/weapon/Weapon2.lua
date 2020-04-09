local Weapon2 = Class{}

function Weapon2:init(x, y)
    self.size = {w=16,h=16}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.gun2, level = 1.5}
    -- self.dragable = true
    self.lootBox = {
      active = false
    }
    self.hadleInput = {
      useAction = {
          scancode = 'space',
          isDown = false
      }
    }
    self.dragWeapon = {
        sprite = Assets.gun2,
        reloadTimer = 0,
        reloadTime = 0.1,
        storePerOne = 1,
        store = 15,
        bulletSpeed = 600,
        bulletLifeTime = 1,
        healthDamage = 1
      }
end

return Weapon2
