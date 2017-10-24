require "scripts/cenario"
--require "scripts/inimigos"
telas={}

function telas.load()
	telas.imgLifeBar = love.graphics.newImage("img/lifebar.png")
	telas.imgPlayEngrenagem = love.graphics.newImage("img/engrenagemPlay.png")
	palco= love.graphics.newImage("img/cenario.png")
	telas.gameState = 1
	telas.desenhaTela= telas.telaStart
	telas.update = telas.updateStart
	telas.imgPlay = love.graphics.newImage("img/play.png")
	telas.imgPlayButton = love.graphics.newImage("img/playButton.png")
	telas.eixo = 0
end




function telas.draw()

	love.graphics.draw(palco,0,0)

	telas.desenhaTela()
	end


function telas.telaStart()
	love.graphics.draw(telas.imgPlayEngrenagem,598,188,math.rad(270+telas.eixo),1,1,telas.imgPlayEngrenagem:getWidth()/2,telas.imgPlayEngrenagem:getWidth()/2)
	love.graphics.draw(telas.imgPlayEngrenagem,598,498,math.rad(270+telas.eixo),1,1,telas.imgPlayEngrenagem:getWidth()/2,telas.imgPlayEngrenagem:getWidth()/2)
	love.graphics.draw(telas.imgPlay,450,180)
	love.graphics.draw(telas.imgPlayButton,520,550)

end
function telas.telaGameOver()
	love.graphics.print("Game Over",100,100)
end

function telas.updateStart(dt)
	telas.eixo=telas.eixo+1
	if love.keyboard.isDown("space") then
		telas.desenhaTela = telas.telaJogo
		player.modificaStatus("jogo")
		telas.update = telas.updateJogo
		cenario.draw = cenario.desenhaNoJogo
		disparo.ultimoDisparo= os.clock("%S")
		inimigos.draw = inimigos.drawNoJogo
		inimigos.update = inimigos.updateNoJogo

	end

end
function telas.telaJogo()
	love.graphics.draw(telas.imgLifeBar,10,10)
	--love.graphics.setColor(0,0,0,220)
	--[[love.graphics.rectangle("fill", 0, 0, 1000,700 )
	love.graphics.setColor(255,255,255,255)]]
end


function telas.updateJogo()
	
end

