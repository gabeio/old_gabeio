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

fnr = ()-> #fills randoms with random numbers
	randoms=[]
	i=0
	while i<30
		randoms.push(Math.floor(Math.random()*12))
		i++
	#console.log randoms

app.get '/', (req,res) ->
	fnr()
	res.render 'index', {randoms:randoms}

app.get '/about-me', (req,res) ->
	res.render 'aboutme', {}

if not module.parent
	if process.argv[2]
		app.listen process.argv[2]
	else
		app.listen 8008
else
	exports ? app