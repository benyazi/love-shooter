local Enemy = Class{}

function Enemy:init(x, y)
    self.size = {w=64,h=64}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.knight, level = 2}
    self.isEnemy = true
    self.health = 100
    self.enemyWeapon = {
        rad = math.pi,
        changePositionTimer = 1
    }
    self.watchDistance = 320
end

return Enemy
