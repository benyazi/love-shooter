local Weapon2 = Class{}

function Weapon2:init(x, y)
    self.size = {w=16,h=16}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.gun3, level = 1.5}
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
        sprite = Assets.gun3,
        reloadTimer = 0,
        reloadTime = 0.5,
        storePerOne = 1,
        store = 10,
        bulletSpeed = 800,
        bulletLifeTime = 0.4,
        healthDamage = 1,
        scatter = math.pi/4,
        bulletCount = 5
      }
end

return Weapon2
