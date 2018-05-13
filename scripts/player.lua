		

require "scripts/disparo"
player={}

function player.load()
	disparo.load(player.dano)

	somSimples = love.audio.newSource("sons/simples.wav")
	somMetralha = love.audio.newSource("sons/metralha.wav")


	bobInverso=love. graphics.newImage("img/bobInverso.png")
    imgPlayers = love.graphics.newImage('img/bob.png')
    imgArma1d = love.graphics.newImage("img/weapon1.png")
    imgArma1E = love.graphics.newImage("img/weapon12.png")
    imgArma3d = love.graphics.newImage("img/weapon-3.png")
    imgArma1b = love.graphics.newImage('img/weapon14.png')
    imgArma1u = love.graphics.newImage("img/weapon13.png")
    imgVida1 = love.graphics.newImage('img/quadrado1.png')
    imgVida2= love.graphics.newImage("img/quadrado2.png")
    imgVida3= love.graphics.newImage("img/quadrado3.png")

 	gridPlayers= anim8.newGrid(imgPlayers:getWidth()/3,imgPlayers:getHeight(), imgPlayers:getWidth(), imgPlayers:getHeight())
 	gridBob=anim8.newGrid(bobInverso:getWidth()/3,bobInverso:getHeight(), bobInverso:getWidth(), bobInverso:getHeight())

 	imgBalaP = love.graphics.newImage('img/balaP.png')
 	imgBalaM = love.graphics.newImage('img/balaM.png')

    andarDireita= anim8.newAnimation(gridBob('1-3',1), 0.10)
    andarEsquerda= anim8.newAnimation(gridPlayers('1-3',1), 0.10)
    andarCima= anim8.newAnimation(gridPlayers('1-3',1), 0.10)
    andarBaixo= anim8.newAnimation(gridPlayers('1-3',1), 0.10)
    player.vida = 3 
 	player.desenhaPlayer= player.naoDesenha
 	player.update=noUpdate
 	player.arma=imgArma1d
 	player.x=500
 	player.y=500
 	player.xHitbox=10+500
 	player.yHitbox=10+500
 	player.widthHitbox=40
 	player.heightHitbox=70
 	player.velocidade=3
 	player.dano = 1 
 	player.widthQuadro = (imgPlayers:getWidth()/3)
 	player.heightQuadro = imgPlayers:getHeight()
	player.width = (imgPlayers:getWidth()/3)
 	player.height = imgPlayers:getHeight()
 	player.lado="down" 	
 	player.ultimoLado="right"
 end 

function player.draw()
	player.desenhaPlayer()
	disparo.draw()
 end

 function player.modificaStatus(status)
 	if(status == "jogo") then
 		player.status = "jogo"
 		player.desenhaPlayer=player.desenhaNoJogo
  		player.update= player.updateNoJogo
  		
 	end

 end

 function player.desenhaNoJogo()
 		  if(player.vida >=1) then
 		  	love.graphics.draw(imgVida1,109,53)
 		  end
 		  if player.vida >=2 then
 		  	love.graphics.draw(imgVida2,129,51)
 		  end
 		  if player.vida >=3 then
 		  	love.graphics.draw(imgVida3,150,51)
 		  end



		if player.lado == "left" then
			andarEsquerda:draw(imgPlayers,player.x,player.y)
			love.graphics.draw(player.arma,player.x+5,player.y+45)



		end

		if player.lado == "right" then
			andarDireita:draw(bobInverso,player.x,player.y)
			love.graphics.draw(player.arma,player.x+5,player.y+45)
		end

		if player.lado == "down" then
			if player.ultimoLado == "left" then
			andarEsquerda:draw(imgPlayers,player.x,player.y)
			love.graphics.draw(player.arma,player.x+5,player.y+45)
			else
			andarDireita:draw(bobInverso,player.x,player.y)
			love.graphics.draw(player.arma,player.x+5,player.y+45)
			end
		end

		if player.lado == "up" then


			if player.ultimoLado == "left" then
			andarEsquerda:draw(imgPlayers,player.x,player.y)
			love.graphics.draw(player.arma,player.x,player.y+45)
			else
			andarDireita:draw(bobInverso,player.x,player.y)
			love.graphics.draw(player.arma,player.x+5,player.y+45)
			end
		end
		
 		--love.graphics.rectangle("fill", player.xHitbox,player.yHitbox,player.widthHitbox,player.heightHitbox)
		
 end

 function player.naoDesenha()
 	return 0
 end

 function player.updateNoJogo(dt)
	



	if player.pass then	

		
		if cenario.sala==5 and player.x>=980 and player.y<400 and player.y>300 then
			player.xHitbox=155
			player.x=144

			player.yHitbox=350
			player.y=350
			cenario.listaElementos = cenario.listaElementos1
			inimigos.lista=inimigos.lista1
			cenario.sala=1

		end

		if player.xHitbox<=150 and player.yHitbox >300 and player.y<400 and cenario.sala==1 then

			player.xHitbox=970
			player.x=970

			player.yHitbox=350
			player.y=350

			cenario.listaElementos = cenario.listaElementos3
			inimigos.lista = inimigos.lista1
			
			
			cenario.sala=5
			
		end

		if player.yHitbox>= 540 and cenario.sala==1 and player.x>500 and player.x<650 then

			player.xHitbox=970
			player.x=970

			player.yHitbox=350
			player.y=350
			cenario.listaElementos = cenario.listaElementos1
			inimigos.lista=inimigos.lista4
			cenario.sala=4
			
		end
		if cenario.sala == 4 and player.lock then
			cenario.sala = 1
		end
		


	end

		if player.vida<=0 then
			telas.gameover=true
		end
		player.colideInimigo()
		player.dt=dt
 		disparo.update(dt)

 				if love.keyboard.isDown("right") and player.taNaTela("right") then
 						player.lado = "right"
 						player.ultimoLado="right"
 						player.arma=imgArma1d
 						player.andar(player.lado,dt)		
 				end
 				if love.keyboard.isDown("up") and player.taNaTela("up") then
	 					
	 					player.andar(player.lado,dt)	
	 					player.lado = "up"
	 			end
	
	 			if love.keyboard.isDown("left") and player.taNaTela("left") then
	 					player.ultimoLado="left"
	 					player.lado = "left"
	 					player.arma=imgArma1E
 						player.andar(player.lado,dt)
	 			end
	
	 			
	
	 			if love.keyboard.isDown("down") and player.taNaTela("down") then
 					player.lado = "down"
 					player.andar(player.lado,dt)
	 				
	 			end
 		
 		
 		if love.keyboard.isDown("space") then
 			
 			if(player.lado == "down") then 
 			player.arma = imgArma1b
 			end
 			if(player.lado == "up") then 
 			player.arma = imgArma1u
 			end
 			disparo.atirar(player.x,player.y, player.lado)
 			if(disparo.atirar==disparo.tiroSimples) then
 				somSimples:play()

 			elseif disparo.atirar ==disparo.metralhadora then
 				somMetralha:play()


 		end 
 	end
 	

 end


 function noUpdate( ... )
 	-- body
 end

 function love.keypressed(key)

end

function player.taNaTela(lado)
	if lado == "left" then
		if player.x >= 125 then
			return true
		else
			return false
		end
	end

	if lado == "right" then
		if player.x + player.widthHitbox <= 125+960 then
			return true
		else
			return false
		end
	end
	
	if lado == "up" then
		if player.y >= 65 then
			return true
		else
			return false
		end
	end

	if lado == "down" then
		if player.yHitbox + player.heightHitbox <= 65+596 then
			return true
		else
			return false
		end
	end
end


function player.colideInimigo()
			if inimigos.lista then
			for j, auxi in ipairs(inimigos.lista) do
				if(player.xHitbox>=auxi.x and player.xHitbox<=auxi.x+auxi.width and player.yHitbox >= auxi.y and player.yHitbox<=auxi.y+auxi.width) then
				table.remove(inimigos.lista,j)
				player.vida=player.vida-1
			end
			end
		end
	end



function player.colidir(x1,y1,w1,h1,x2,y2,w2,h2)

	if(x1 >= x2+w2 or x1 + w1  <= x2 or y1 >= y2+h2 or y1+h1 <= y2  )then
		
		return true
	else

		return false

	end
end

function player.andar(lado,dt)
	if (lado =="right") then
		for i,aux in ipairs(cenario.listaElementos) do
			if(player.yHitbox+player.heightHitbox >= aux.yHitbox and player.yHitbox+player.heightHitbox <= aux.yHitbox +aux.heightHitbox and
			 
			 (player.xHitbox + player.widthHitbox) + player.velocidade >= aux.xHitbox and (player.xHitbox + player.widthHitbox)
			  + player.velocidade <= aux.xHitbox+aux.widthHitbox  ) then
			
				andarDireita:update(dt)
 				player.lado = "right"
 				player.ultimoLado = "right"
 				if(aux.nome=="update") then
 					disparo.atirar=disparo.metralhadora
 					--table.remove(cenario.listaElementos,i)
 				end
 			else

 				player.xHitbox=player.xHitbox+player.velocidade
 				player.x = player.x + player.velocidade
 				andarDireita:update(dt)
 				player.lado = "right"
 				player.ultimoLado="right"
 				

			end
		end
	end 
	if (lado =="left") then
		for i,aux in ipairs(cenario.listaElementos) do
			if(player.yHitbox+player.heightHitbox) >= aux.yHitbox and player.yHitbox+player.heightHitbox <= aux.yHitbox+aux.heightHitbox and

			 (player.xHitbox - player.velocidade <= aux.xHitbox + aux.widthHitbox and (player.xHitbox)>= aux.xHitbox) then

				andarEsquerda:update(dt)
 				player.lado = "left"
 				player.ultimoLado = "left"
 				if(aux.nome=="update") then
 					disparo.atirar=disparo.metralhadora
 					--table.remove(cenario.listaElementos,i)
 				end

 			else

 				player.xHitbox=player.xHitbox-player.velocidade
 				player.x = player.x - player.velocidade
 				andarEsquerda:update(dt)
 				player.lado = "left" 
 				player.ultimoLado = "left"
 				

			end
		end
	end 
	
	if (lado =="up") then
		for i,aux in ipairs(cenario.listaElementos) do

			if  ((player.xHitbox+player.widthHitbox >= aux.xHitbox and player.xHitbox+player.widthHitbox <= aux.xHitbox+aux.widthHitbox or
				player.xHitbox >= aux.xHitbox	and player.xHitbox<=aux.xHitbox+aux.widthHitbox)  and 

				((player.yHitbox+(player.heightHitbox))-player.velocidade <= aux.yHitbox + aux.heightHitbox ) and (player.yHitbox+player.heightHitbox-player.velocidade)>=aux.yHitbox) then

				if player.ultimoLado == "left" then
					if(aux.nome=="update") then
 					disparo.atirar=disparo.metralhadora
 					--table.remove(cenario.listaElementos,i)
 				end
				andarEsquerda:update(dt)
				else
				andarDireita:update(dt)
				end
			

 			else
 				if player.ultimoLado == "left" then
 					
				andarEsquerda:update(dt)
				else
				andarDireita:update(dt)
				end
 				player.yHitbox=player.yHitbox-player.velocidade
 				player.y = player.y - player.velocidade
 				andarCima:update(dt)
 				player.lado = "up"

			end
		end
	end 
	if (lado =="down") then
		for i,aux in ipairs(cenario.listaElementos) do

			if  ((player.xHitbox+player.widthHitbox >= aux.xHitbox and player.xHitbox+player.widthHitbox <= aux.xHitbox+aux.widthHitbox or
				player.xHitbox >= aux.xHitbox	and player.xHitbox<=aux.xHitbox+aux.widthHitbox)  and 

				(player.yHitbox + player.heightHitbox) + player.velocidade >= aux.yHitbox and (player.yHitbox + player.heightHitbox)
			  + player.velocidade <= aux.yHitbox+aux.heightHitbox  ) then

				if player.ultimoLado == "left" then
					if(aux.nome=="update") then
 					disparo.atirar=disparo.metralhadora
 				--	table.remove(cenario.listaElementos,i)
 				end
				andarEsquerda:update(dt)
				else
				andarDireita:update(dt)
				end
 				player.lado = "down"				

 			else
 				if player.ultimoLado == "left" then
 					
				andarEsquerda:update(dt)
				else
				andarDireita:update(dt)
				end
 				player.yHitbox=player.yHitbox+player.velocidade
 				player.y = player.y + player.velocidade
 				andarBaixo:update(dt)
 				player.lado = "down"

			end
		end
	end 

	





end

