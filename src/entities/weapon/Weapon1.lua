local Weapon1 = Class{}

function Weapon1:init(x, y)
    self.size = {w=16,h=16}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.gun, level = 1.5}
    self.dragable = true
    self.dragWeapon = {
        sprite = Assets.gun,
        reloadTimer = 0,
        reloadTime = 0.6,
        storePerOne = 1,
        store = 30,
        bulletSpeed = 150,
        bulletLifeTime = 5,
        healthDamage = 1
      }
end

return Weapon1