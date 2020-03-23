local assets = {}

local function image(name, fp)
	assets[name] = love.graphics.newImage(fp)
	-- for pixel art you may add this filter
	assets[name]:setFilter('nearest', 'nearest')
end

local function imageData(name, fp)
	assets[name] = love.image.newImageData(fp)
end

function assets.load()
	image('arrow_up','assets/sprites/arrow_up.png')
	image('arrow_down','assets/sprites/arrow_down.png')
	image('arrow_left','assets/sprites/arrow_left.png')
	image('arrow_right','assets/sprites/arrow_right.png')
	image('mario','assets/sprites/mario.png')
	image('hole','assets/sprites/hole.png')
	image('pump','assets/sprites/pump.png')
	image('ship','assets/sprites/ship.png')
	image('gun','assets/sprites/gun.png')
	image('gun2','assets/sprites/gun2.png')
	image('gun3','assets/sprites/gun3.png')
	image('knight','assets/sprites/knight.png')
	image('ground_1','assets/sprites/ground_1/g_tile_1.png')
end

return assets
