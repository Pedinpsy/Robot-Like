cenario={}
cenario.listaElementos={}
cenario.listaElementos1={}
cenario.listaElementos2={}
cenario.listaElementos3={}
function cenario.load()
update= love.graphics.newImage("img/update.png")
grid = love.graphics.newQuad(0,0,update:getWidth()/2,update:getHeight(),update:getDimensions())
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

--cenario.listaElementos = cenario.listaElementos2





cenario.listaElementos=cenario.listaElementos1

end

function cenario.desenhaNoJogo()

	for i,aux in ipairs(cenario.listaElementos) do
		love.graphics.draw(aux.img, aux.x, aux.y)
		if(player.yHitbox+player.heightHitbox>aux.y+aux.height) then
			player.draw()
		end
	end
	
end

function cenario.naoDesenha()
	-- body
end