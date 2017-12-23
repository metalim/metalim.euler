{_log,test,expect,main} = require './util'


class Solver
	constructor: (@input)->
		@data = @input.split('\n').join('').split('').map (a)->+a
		return

	solve: (len)->
		max = 0
		out = []
		for i in [0..@data.length-len]
			sub = @data[i...i+len]
			mul = sub.reduce (a,b)->a*b
			#_log sub, mul
			if max<mul
				max=mul
				out=sub
		[out, max]


test.some = ->
	s = new Solver require './input/8.txt'
	expect.equal [[9,9,8,9],5832], s.solve 4
	return

main ->
	s = new Solver require './input/8.txt'
	_log.yellow s.solve 13
	return
