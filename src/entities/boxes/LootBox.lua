local LootBox = Class{}

function LootBox:init(x, y)
    self.size = {w=32,h=32}
    self.position = {x=x,y=y}
    self.drawSprite = {sprite = Assets.box, level = 1.3, scale={x=0.5,y=0.5}}
    self.isBox = true
    self.lootBox = {
        active = false
    }
    self.hadleInput = {
        useAction = {
            scancode = 'e',
            isDown = false
        }
    }
end

return LootBox
