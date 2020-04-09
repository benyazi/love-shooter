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
local astray = require 'lib.astray'

-- load world
local world = require 'src.world'

--load ecs
Components = require.tree('src.components')
Entities = require.tree('src.entities')
Systems = require.tree('src.systems')

-- create new world
World = world:new(
  Bump.newWorld(32),
  Systems.draw.UpdateAnimation,
  Systems.input.HandleInput,
  Systems.enemy.EnemyCalculation,
  Systems.drag.DragThing,
  Systems.enemy.ActivateEnemy,
  Systems.enemy.EnemyMoving,
  Systems.loot.CheckActive,
  Systems.granate.GranateMoving,
  Systems.granate.GranateThrow,
  Systems.granate.GranateTouchDamage,
  Systems.granate.GranateExplosion,
  Systems.weapon.CreateBulletWeapon,
  Systems.weapon.RunWeapon,
  Systems.weapon.RunWeaponEnemy,
  Systems.weapon.ChangeWeaponEnemyPosition,
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
  Systems.loot.DrawActiveText,
  Systems.dev.DrawFpsSystem,
  Systems.enemy.DrawEnemyCount,
  Systems.enemy.EnemyDie,
  Systems.loot.CheckButton,
  Systems.loot.OpenLootbox,
  Systems.loot.LootObject,
  Systems.clear.ClearEventSystem,
  Systems.clear.RemoveTimer,
  Systems.gameManager.GameOverText
)

--  create system filters
local drawFilter = Tiny.requireAll('isDrawSystem')
local drawGuiFilter = Tiny.requireAll('isDrawGuiSystem')
local updateFilter = Tiny.rejectAny('isDrawSystem','isDrawGuiSystem')

ENEMY_COUNT = 0
STAT = {
  KILLS = 0
}

GAME_MANAGER = {
  gameManager = true
}
function love.load()
  love.window.setTitle( 'GAME' )
  -- load all image, sound and etc.
  Assets.load()
	love.graphics.setNewFont('assets/PixelNES.otf', 8)
  --  save window size to global
  WindowHeight = love.graphics.getHeight()
  WindowWidth = love.graphics.getWidth()
  --  Create camera instanse and set zoom value
  Camera = camera(WindowWidth/2,WindowHeight/2)
  local cam_scale = 1
  Camera:zoomTo(cam_scale)
-- set random seed
  math.randomseed(os.time())
  
  
  World:addEntity(GAME_MANAGER)

  

  -- Add sumply entity for print FPS system
  World:addEntity({drawFps = true})
  local mapH, mapW = 40, 40
  local generator = astray.Astray:new( mapH/2-1, mapW/2-1, 30, 70, 50, astray.RoomGenerator:new(5, 4, 5, 4, 5) )
  local dungeon = generator:Generate()
  local tiles = generator:CellToTiles( dungeon )
  local playerSpawn = false
  for y = 0, #tiles[1] do
    local line = ''
    for x = 0, #tiles do
      -- local j,i = x+1,y+1
      local curX, curY = y*64,x*64
      local ground = Entities.Ground(curX, curY)
      World:addEntity(ground)
      if tiles[y][x] == '#' then 
        World:addEntity(Entities.Wall(curX, curY))
      elseif playerSpawn == false then
        local player = Entities.Player(curX, curY)
        player.keyMoving = {speed = 1}
        player.targetSmooth = true
        World:addEntity(Entities.weapon.Weapon2(player.position.x+16, player.position.y+16))
        World:addEntity(Entities.weapon.Granate(player.position.x+16, player.position.y+16))
        World:addEntity(player)
        playerSpawn = true
      else
        local randValue = math.random(0,100)
        if randValue > 75 then
          local enemy = Entities.Enemy(curX, curY)
          local weaponData = Entities.weapon.Weapon1(curX, curY)
          enemy.weapon = weaponData.dragWeapon
          World:addEntity(enemy)
        elseif randValue < 15 then
          local lootBox = Entities.boxes.LootBox(curX+16, curY+16)
          World:addEntity(lootBox)
        end
      end
      line = line .. tiles[y][x]
    end
    print(line)
  end


  -- for i=1,20 do
  --   for j=1,20 do
  --     local curX, curY = (i-1)*64,(j-1)*64
  --     local ground = Entities.Ground(curX, curY)
  --     World:addEntity(ground)
  --     if i == 1 or i == 20 then
  --       World:addEntity(Entities.Wall(curX, curY))
  --     elseif j == 20 or j == 1 then
  --       World:addEntity(Entities.Wall(curX, curY))
  --     elseif math.random(0,50) > 45 then
  --       World:addEntity(Entities.Wall(curX, curY))
  --     elseif math.random(0,100) > 92 then
  --       local enemy = Entities.Enemy(curX, curY)
  --       local weaponData = Entities.weapon.Weapon1(curX, curY)
  --       enemy.weapon = weaponData.dragWeapon
  --       World:addEntity(enemy)
  --     elseif math.random(0,100) > 94 then
  --       local lootBox = Entities.boxes.LootBox(curX+16, curY+16)
  --       World:addEntity(lootBox)
  --       -- local weaponType = math.random(2,3)
  --       -- if weaponType == 1 then 
  --       --   World:addEntity(Entities.weapon.Weapon1(curX+16, curY+16))
  --       -- elseif weaponType == 2 then 
  --       --   World:addEntity(Entities.weapon.Weapon2(curX+16, curY+16))
  --       -- elseif weaponType == 3 then 
  --       --   World:addEntity(Entities.weapon.Weapon3(curX+16, curY+16))
  --       -- end
  --     end
  --   end
  -- end
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
  if scancode == 'escape' then 
    love.event.quit()
  end
end

function love.keyreleased(k, scancode)
end
