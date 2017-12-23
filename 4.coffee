{_log,test,expect,main} = require './util'

is_pal = (n)->
	s=n.toString()
	p=s.split('').reverse().join ''
	s is p

largest_pal_mul = (n)->
	min = Math.pow 10, n-1
	below = Math.pow 10, n
	pals = []
	for i in [min...below]
		for j in [i...below] when is_pal i*j
			pals.push i*j
	Math.max pals...

test.pals = ->
	expect 9009, largest_pal_mul 2
	return

main ->
	_log.yellow largest_pal_mul 3
	return
