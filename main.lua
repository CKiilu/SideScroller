-- Debug settings
debug = true

-- Initialize tables
platform = {
	x = 0
}
player = {
	y_velocity = 0,
	jump_height = -200,
	gravity = -500,
	speed = 200
}

function love.load(arg)
	platform.width = love.graphics.getWidth()
	platform.height = love.graphics.getHeight()

	platform.y = platform.height / 2

	player.x = love.graphics.getWidth() / 2
	player.y = love.graphics.getHeight() / 2
	player.ground = player.y

	player.img = love.graphics.newImage('/assets/images/Hat_man1.png')

end

function love.update(dt)
	if love.keyboard.isDown('left', 'a') then
		if player.x > 0 then
			player.x = player.x - (player.speed * dt)
		end
	end
	if love.keyboard.isDown('right', 'd') then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	end
	if love.keyboard.isDown('space', 'w', 'up') then
		if player.y_velocity == 0 then
			player.y_velocity = player.jump_height
		end
	end

	if player.y_velocity ~= 0 then
		player.y = player.y + (player.y_velocity * dt)
		player.y_velocity = player.y_velocity - (player.gravity * dt)
	end

	if player.y > player.ground then
		player.y_velocity = 0
		player.y = player.ground
	end
end

function love.draw(dt)
	-- Draw platform (White rectangle filling half the screen)
	love.graphics.setColor(255, 255, 255)
	love.graphics.rectangle('fill', platform.x, platform.y, platform.width, platform.height)

	-- Draw player
	love.graphics.draw(player.img, player.x, player.y, 0, .5, .5, 0, 100)
end