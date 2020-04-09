local Enemy = Class{}

function Enemy:init(x, y)
    self.size = {w=48,h=48}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.knight, level = 2}
    self.isEnemy = true
    self.canDrag = true
    self.health = 2
    self.enemyWeapon = {
        rad = math.pi,
        changePositionTimer = 1
    }
    self.watchDistance = 320
    self.behaviourState = 'idle'
    self.enemyMoving = {
        rad = math.pi,
        changeTimer = 0,
        speed = 20
    }
end

return Enemy
