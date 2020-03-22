local Weapon2 = Class{}

function Weapon2:init(x, y)
    self.size = {w=16,h=16}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.gun2, level = 1.5}
    self.dragable = true
    self.dragWeapon = {
        sprite = Assets.gun2,
        reloadTimer = 0,
        reloadTime = 0.05,
        storePerOne = 1,
        store = 50,
        bulletSpeed = 800,
        bulletLifeTime = 1,
        healthDamage = 15
      }
end

return Weapon2
