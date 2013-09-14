swig = require 'swig'
con = require 'consolidate'
ex = require 'express'
app = ex()
app.engine '.html', con.swig
app.set 'view engine', 'html'
app.set 'views', '.'
swig.init {
	cache: false
	root: '.'
}

randoms=[]

fnr = ()-> #F.ills randoms with random numbers
	randoms=[]
	out = false
	while out!=true # loop until we get a number between 5 & 60
		number = Math.floor(Math.random()*60)
		if number>5
			randoms.push(number)
			out=true
	i=0
	while i<30
		rand_num = Math.floor(Math.random()*12) #generate & store random number(0-12)
		if rand_num>2 # if random# is >2
			randoms.push(rand_num) #then add random number to already existing list
			i++ # and add 1 to i...
	#console.log randoms

normal=[0]
i=0
while i<11
	normal.push(11)
	normal.push(0)
	i++

app.get '/', (req,res) ->
	fnr()
	res.render 'index', {randoms:randoms}

app.get '/normal', (req,res) ->
	res.render 'normal', {randoms:normal}

app.get '/about-me', (req,res) ->
	res.render 'aboutme', {}

if not module.parent
	if process.argv[2]
		app.listen process.argv[2]
	else
		app.listen 8008
else
	exports ? app