
-- Todo tipo de disparo deve ter trez paramentros, x,y,lado --
disparo = {}
require "scripts/inimigos"

function disparo.load(dano)
	disparo.listaDisparos= {}
	disparo.imgTiroSimples = love.graphics.newImage('img/ShotBob.png')
	disparo.imgMetralhadora = love.graphics.newImage('img/balaMetralha.png')
	
	disparo.localTiro = 10
	disparo.dano = dano
	disparo.atirar = disparo.tiroSimples
	disparo.velocidade = 4 
	disparo.delay = 0.5
	disparo.ultimoDisparo = 0 
end


function disparo.draw()
	if(table.getn(disparo.listaDisparos) ~= 0 )  then
		for i,aux in ipairs(disparo.listaDisparos) do
			love.graphics.draw(aux.img , aux.x , aux.y,aux.angulo,1)
		end
	end
end

function disparo.update(dt)
	disparo.colideInimigo()
	if(table.getn(disparo.listaDisparos) ~= 0 )  then
		for i,aux in ipairs(disparo.listaDisparos) do
			aux.x = aux.x + aux.incrementoX
			aux.y = aux.y + aux.incrementoY
		end
	end
end
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end


function disparo.colideInimigo()
	if inimigos.lista then
	if(table.getn(disparo.listaDisparos) ~= 0 )  then
		for i,auxd in ipairs(disparo.listaDisparos) do
			for j, auxi in ipairs(inimigos.lista) do
				
				if  CheckCollision(auxd.x,auxd.y,0,0,auxi.x,auxi.y,auxi.width,auxi.height)  then
				table.remove(inimigos.lista,j)
				table.remove(disparo.listaDisparos,i)
			
			end
		end
	end
	end

end
end

function disparo.tiroSimples(x,y,lado)
	if (disparo.ultimoDisparo + disparo.delay <= os.clock("%S") ) then
		auxiliar = {}
		auxiliar.angulo = 0
		auxiliar.img = disparo.imgTiroSimples
		auxiliar.x = x+(player.widthQuadro/2)-(auxiliar.img:getWidth()/2)
		auxiliar.y = y+(player.heightQuadro/2)-(auxiliar.img:getHeight()/2)
		auxiliar.lado = lado
		auxiliar.dano = disparo.dano
		disparo.delay= 0.5
		
	
		if (lado == "left") then
			auxiliar.x = x
			auxiliar.y = y+80
			auxiliar.angulo = math.rad(180)
			auxiliar.incrementoY = 0
			auxiliar.incrementoX = disparo.velocidade*-1
		end
	
		if(lado == "right") then
			auxiliar.incrementoY = 0
			auxiliar.incrementoX = disparo.velocidade
	
		end
	
		if(lado == "up") then
		auxiliar.angulo =  math.rad(270)
			auxiliar.incrementoY = disparo.velocidade*-1
			auxiliar.incrementoX = 0
	
		end
	
		if(lado == "down") then
			auxiliar.angulo =  math.rad(90)
			auxiliar.incrementoY = disparo.velocidade
			auxiliar.incrementoX = 0
	
		end
		table.insert(disparo.listaDisparos,auxiliar)
		disparo.ultimoDisparo = os.clock("%S")
		
	end
end

function disparo.metralhadora(x,y,lado)
	if (disparo.ultimoDisparo + disparo.delay <= os.clock("%S") ) then
		auxiliar = {}
		auxiliar.angulo = 0 	
		disparo.delay= 0.1
		auxiliar.img = disparo.imgMetralhadora
		auxiliar.x = x+(player.widthQuadro/2)-(auxiliar.img:getWidth()/2)
		auxiliar.y = y+(player.heightQuadro/2)-(auxiliar.img:getHeight()/2)
		auxiliar.lado = lado
		auxiliar.dano = disparo.dano
		if disparo.localTiro >= 5 then
			disparo.localTiro = 1
		end
	
		if (lado == "left") then
			auxiliar.y = auxiliar.y + (5*disparo.localTiro)
			auxiliar.incrementoY = 0
			auxiliar.angulo = math.rad(180)
			auxiliar.incrementoX = disparo.velocidade*-1.5
		end
	
		if(lado == "right") then
			auxiliar.y = auxiliar.y + (2*disparo.localTiro)
			auxiliar.incrementoY = 0
			auxiliar.incrementoX = disparo.velocidade*1.5
	
		end
	
		if(lado == "up") then
			auxiliar.x = auxiliar.x + (2*disparo.localTiro)
			auxiliar.angulo =  math.rad(270)
			auxiliar.incrementoY = disparo.velocidade*-1.5
			auxiliar.incrementoX = 0
	
		end
	
		if(lado == "down") then
			auxiliar.x = auxiliar.x + (2*disparo.localTiro)
			auxiliar.angulo =  math.rad(90)
			auxiliar.incrementoY = disparo.velocidade*1.5
			auxiliar.incrementoX = 0
	
		end
		table.insert(disparo.listaDisparos,auxiliar)
		disparo.ultimoDisparo = os.clock("%S") 
		disparo.localTiro = disparo.localTiro + 1 
	end
end