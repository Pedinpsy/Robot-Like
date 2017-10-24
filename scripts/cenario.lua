cenario={}
cenario.listaElementos={}
cenario.listaElementos1={}
cenario.listaElementos2={}
cenario.listaElementos3={}
function cenario.load()
update= love.graphics.newImage("img/update.png")
grid= love.graphics.newQuad(0,0,update:getWidth()/2,update:getHeight(),update:getDimensions())
cenario.sala = 1
portal1f = love.graphics.newImage('img/portaFechada1.png')
portal2f = love.graphics.newImage('img/portaFechada2.png')
portal3f = love.graphics.newImage('img/portaFechada3.png')
portal4f = love.graphics.newImage('img/portaFechada4.png')
barril = love.graphics.newImage('img/barril.png')
caixa = love.graphics.newImage('img/caixa.png')
porta1= love.graphics.newImage('img/porta1.png')
porta2= love.graphics.newImage('img/porta2.png')
porta3= love.graphics.newImage('img/porta-3.png')
porta4= love.graphics.newImage('img/porta4.png')
cenario.draw = cenario.naoDesenha

aaux = {}
aaux.x = 200
aaux.y = 500
aaux.widthHitbox=40
aaux.heightHitbox=40
aaux.xHitbox = 10+aaux.x
aaux.yHitbox = 18+aaux.y
aaux.img = caixa
aaux.nome = "barril"
aaux.width = aaux.img:getWidth()
aaux.height = aaux.img:getHeight()

table.insert(cenario.listaElementos1,aaux)
aaux = {}
aaux.x = 300
aaux.y = 500
aaux.widthHitbox=40
aaux.heightHitbox=40
aaux.xHitbox = 10+aaux.x
aaux.yHitbox = 18+aaux.y
aaux.img = caixa
aaux.nome = "barril"
aaux.width = aaux.img:getWidth()
aaux.height = aaux.img:getHeight()

table.insert(cenario.listaElementos2,aaux)

--cenario.listaElementos = cenario.listaElementos2

aaux = {}
aaux.x = 200
aaux.y = 500
aaux.widthHitbox=40
aaux.heightHitbox=40
aaux.xHitbox = 10+aaux.x
aaux.yHitbox = 18+aaux.y
aaux.img = update
aaux.nome = "update"
aaux.width = aaux.img:getWidth()
aaux.height = aaux.img:getHeight()

table.insert(cenario.listaElementos3,aaux)



cenario.listaElementos=cenario.listaElementos1

end

function cenario.desenhaNoJogo()
	if(cenario.sala==3) then
		inimigos.lista= inimigos.lista3
	end
	
	
	for i,aux in ipairs(cenario.listaElementos) do
		if aux.nome=="update" then
			love.graphics.draw(update,grid,aux.x,aux.y)
			--love.graphics.rectangle("fill",aux.xHitbox,aux.yHitbox,aux.widthHitbox,aux.heightHitbox)
			player.lock=true
		elseif (player.yHitbox+player.heightHitbox<aux.yHitbox) then 
		love.graphics.draw(aux.img, aux.x, aux.y)
		--love.graphics.rectangle("fill", aux.x, aux.y, aux.width,aux.heigth)
		--
		--love.graphics.rectangle("fill",aux.xHitbox,aux.yHitbox,aux.widthHitbox,aux.heightHitbox)
	else
		love.graphics.draw(aux.img, aux.x, aux.y)
		--love.graphics.rectangle("fill", aux.x, aux.y, aux.width,aux.heigth)
		--love.graphics.rectangle("fill",aux.xHitbox,aux.yHitbox,aux.widthHitbox,aux.heightHitbox)
		player.draw()
	end
	end
	
	if #inimigos.lista == 0 then

		if cenario.sala==1 then
		love.graphics.draw(porta3,25,300)
		--love.graphics.draw(porta1,1090,300)
		love.graphics.draw(porta2,550,660)
		player.pass=true
		end
		if cenario.sala == 2 then
		love.graphics.draw(porta3,25,300)
		player.pass=true
		end

		if cenario.sala== 3 then
			love.graphics.draw(porta1,1090,300)
			player.pass=true
		end
		if cenario.sala== 4  then
			love.graphics.draw(porta4,550,20)
			love.graphics.draw(porta2,550,660)
			player.pass=true
		end
		if cenario.sala==5 then
			love.graphics.draw(porta1,1090,300)
			player.pass=true
		end


	else
		if cenario.sala==5 then 
		love.graphics.draw(portal1f,1090,300)
	end

		if cenario.sala== 3 then
			love.graphics.draw(portal1f,1090,300)
		end
		if cenario.sala== 4 then
			love.graphics.draw(portal4f,550,20)
			love.graphics.draw(portal2f,550,660)
		end


		if cenario.sala==1 then
		--love.graphics.draw(portal1f,1090,300)
		love.graphics.draw(portal3f,25,300)
		love.graphics.draw(portal2f,550	,660)
		player.pass=false
	end
	if cenario.sala == 2 then
		love.graphics.draw(portal3f,25,300)
		player.pass=false
	end


		


end
end

function cenario.naoDesenha()
	-- body
end