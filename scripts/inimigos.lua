
inimigos={}



function inimigos.load()

	inimigos.lista={}
	inimigos.lista1={}
inimigos.lista3 ={}
inimigos.lista4 ={}

	imgRivaloBob= love.graphics.newImage("img/spriteEnemy1.png")
	imgRivaloBob2= love.graphics.newImage("img/spriteEnemy2.png")

	gridRivaldoBob= anim8.newGrid(imgRivaloBob:getWidth()/3,imgRivaloBob:getHeight(),imgRivaloBob:getWidth(),imgRivaloBob:getHeight())
	gridRivaldoBob2= anim8.newGrid(imgRivaloBob2:getWidth()/3,imgRivaloBob2:getHeight(),imgRivaloBob2:getWidth(),imgRivaloBob2:getHeight())

	andar = anim8.newAnimation(gridRivaldoBob('1-3',1),0.1)
	andar2 = anim8.newAnimation(gridRivaldoBob2('1-3',1),0.1)



	inimigos.draw=inimigos.nodraw
	inimigos.update=inimigos.noUpdate

	imgInimigo1 = love.graphics.newImage('img/inimigo1.png')
	gridInimigo1= anim8.newGrid(imgInimigo1:getWidth()/5,imgInimigo1:getHeight(), imgInimigo1:getWidth(), imgInimigo1:getHeight())

	atirar = anim8.newAnimation(gridInimigo1('1-5',1),0.1)
	
	
	inimigoAux = {}
	inimigoAux.x = 150
	inimigoAux.y = 100
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	table.insert(inimigos.lista,inimigoAux)
	inimigoAux = {} 
	inimigoAux.x = 150
	inimigoAux.y = 300
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	table.insert(inimigos.lista,inimigoAux) 
	inimigoAux = {} 
	inimigoAux.x = 150
	inimigoAux.y = 300
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	inimigos.lista2={}
	table.insert(inimigos.lista2,inimigoAux)




	inimigoAux = {} 
	inimigoAux.x = 300
	inimigoAux.y = 300
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	inimigos.lista2={}
	table.insert(inimigos.lista3,inimigoAux)

	inimigoAux = {} 
	inimigoAux.x = 150
	inimigoAux.y = 300
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	inimigos.lista2={}
	table.insert(inimigos.lista3,inimigoAux)


	inimigoAux = {} 
	inimigoAux.x = 150
	inimigoAux.y = 100
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	inimigos.lista2={}
	table.insert(inimigos.lista4,inimigoAux)
	inimigoAux = {} 
	inimigoAux.x = 150
	inimigoAux.y = 200
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	inimigos.lista2={}
	table.insert(inimigos.lista4,inimigoAux)
	inimigoAux = {} 
	inimigoAux.x = 150
	inimigoAux.y = 300
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	inimigos.lista2={}
	table.insert(inimigos.lista4,inimigoAux)
	inimigoAux = {} 
	inimigoAux.x = 150
	inimigoAux.y = 400
	inimigoAux.width=imgInimigo1:getWidth()/5
	inimigoAux.height=imgInimigo1:getHeight()
	inimigoAux.anin = andar
	inimigoAux.xIncremento = 2
	inimigoAux.nome= "rivaldoBob"
	inimigoAux.img=imgRivaloBob
	inimigos.lista2={}
	table.insert(inimigos.lista4,inimigoAux)


end

function inimigos.noUpdate( )

end

function inimigos.nodraw( )
end

function inimigos.updateNoJogo(dt)
	
	inimigos.updateInimigos()	
if inimigos.lista then
for i, aux in pairs(inimigos.lista) do
		if aux.nome=="rivaldoBob" then
			aux.anin:update(dt)
			end
	end
	end

end
function inimigos.drawNoJogo()

if inimigos.lista then	
for i, aux in pairs(inimigos.lista) do
		if aux.nome=="rivaldoBob" then
			aux.anin:draw(aux.img,aux.x,aux.y)

			end
	end
end

	if telas.gameover then
		 
		--love.graphics.rectangle("fill",0,0,2000,2000)
		--	love.graphics.draw(imgGameOver,0,0)
	end

end

function inimigos.updateInimigos()
	if inimigos.lista then
	for i, aux in pairs(inimigos.lista) do
		if aux.nome=="rivaldoBob" then
			inimigos.rivaldoBob(aux)
		end
	end
end
end

function inimigos.rivaldoBob(rivaldo)
	if(rivaldo.x+rivaldo.xIncremento >= 1000) then
		rivaldo.xIncremento = -2
		rivaldo.img=imgRivaloBob2
		rivaldo.aninDireita=andar2
	end
	if(rivaldo.x- rivaldo.xIncremento<=122) then
		rivaldo.xIncremento = 2 
		rivaldo.img=imgRivaloBob
		rivaldo.aninDireita=andar
	end
	rivaldo.x = rivaldo.x+rivaldo.xIncremento
end

function inimigos.voador(voador)
	-- body
end