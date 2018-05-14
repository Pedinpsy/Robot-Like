require "scripts/telas"
anim8 = require 'scripts/anim8'
require "scripts/player"
require "scripts/inimigos"

function love.load()
	imgGameOver= love.graphics.newImage("img/gameOver.png")
	som=love.audio.newSource("sons/menu.mp3",'stream')
	cenario.load()
	telas.load()
	player.load()
	inimigos.load()
	som:setVolume(0.0)
end

function love.update(dt)
	love.audio.play(som)
	player.update(dt)
	telas.update(dt)
	inimigos.update(dt)
end

function love.draw()
	telas.draw()
	player.draw()
	cenario.draw()
	inimigos.draw()
	if telas.gameover  then
		
		love.graphics.rectangle("fill",0,0,2000,2000)
		love.graphics.setColor(255,255,255)
		love.graphics.draw(imgGameOver,400,300)

	end


end
