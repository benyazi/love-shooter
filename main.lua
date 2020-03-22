--load libs
require 'lib.require'
local camera = require 'lib.hump.camera'
Vector = require 'lib.hump.vector'
Class = require 'lib.hump.class'
Anim8 = require 'lib.anim8.anim8'
Assets = require 'src.assets'
Tiny = require 'lib.tiny-ecs.tiny'
Inspect = require 'lib.inspect.inspect'
Bump = require 'lib.bump.bump'
Beholder = require 'lib.beholder'

-- load world
local world = require 'src.world'

--load ecs
Components = require.tree('src.components')
Entities = require.tree('src.entities')
Systems = require.tree('src.systems')

-- create new world
World = world:new(
  Bump.newWorld(32),
  Systems.drag.DragThing,
  Systems.weapon.CreateBulletWeapon,
  Systems.weapon.RunWeapon,
  Systems.weapon.RunBullet,
  Systems.weapon.CheckCollisionBullet,
  Systems.health.CheckHealth,
  Systems.draw.DrawRectSystem,
  Systems.moving.KeyMoving,
  Systems.camera.TargetSmooth,
  Systems.draw.DrawSprite,
  Systems.weapon.DrawBullet,
  Systems.weapon.DrawWeapon,
  Systems.health.DrawHealthLevel,
  Systems.dev.DrawFpsSystem,
  Systems.clear.ClearEventSystem
)

--  create system filters
local drawFilter = Tiny.requireAll('isDrawSystem')
local drawGuiFilter = Tiny.requireAll('isDrawGuiSystem')
local updateFilter = Tiny.rejectAny('isDrawSystem','isDrawGuiSystem')

function love.load()
  love.window.setTitle( 'GAME' )
  -- load all image, sound and etc.
  Assets.load()
  --  save window size to global
  WindowHeight = love.graphics.getHeight()
  WindowWidth = love.graphics.getWidth()
  --  Create camera instanse and set zoom value
  Camera = camera(WindowWidth/2,WindowHeight/2)
  local cam_scale = 1
  Camera:zoomTo(cam_scale)
-- set random seed
  math.randomseed(os.time())


  for i=1,10 do
    local enemy = Entities.Enemy(
      10 * love.math.random(0, 64),
      10 * love.math.random(0, 64))
    World:addEntity(enemy)
  end

  for i=1,2 do
    local weapon1 = Entities.weapon.Weapon1(
      10 * love.math.random(0, 64),
      10 * love.math.random(0, 64)
    )
    World:addEntity(weapon1)
    local weapon2 = Entities.weapon.Weapon2(
      10 * love.math.random(0, 64),
      10 * love.math.random(0, 64)
    )
    World:addEntity(weapon2)
  end
  
  local player = Entities.Player(
    10 * love.math.random(0, 64),
    10 * love.math.random(0, 64)
  )
  player.keyMoving = {speed = 1}
  player.targetSmooth = true
  -- player.weapon = {
  --   sprite = nil,
  --   reloadTimer = 0,
  --   reloadTime = 0.2,
  --   storePerOne = 1,
  --   store = 100,
  --   bulletSpeed = 500,
  --   bulletLifeTime = 1
  -- }
  World:addEntity(player)

  

  -- Add sumply entity for print FPS system
  World:addEntity({drawFps = true})

  for i=1,20 do
    for j=1,20 do
      local ground = Entities.Ground((i-1)*64,(j-1)*64)
      World:addEntity(ground)
    end
  end
end

function love.draw()
  Camera:attach() --switch to camera scope
    World:update(love.timer.getDelta(), drawFilter)
  Camera:detach() --return from camera scope
  World:update(love.timer.getDelta(), drawGuiFilter)
end

function love.update(dt)
  World:update(dt,updateFilter)
end

function love.mousepressed(x, y, button)
  World:addEntity(Entities.events.MouseClick(x,y,button))
end

function love.keypressed(key, scancode, isrepeat)
end

function love.keyreleased(k, scancode)
end
