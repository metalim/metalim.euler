{_log,test,expect,main} = require './util'
#
# https://projecteuler.net/problem=34
#

fact = ( n )->
	fact[n] ?= do->
		f = 1
		for i in [1...n+1] # NB! fact 0 is 1
			f *= i
		f

is_curious = (n)->
	if n>9
		fs = n.toString().split('').map (c)->fact +c
		n is fs.reduce (a,b)->a+b

get_all_curious = ->
	curs = []
	f9 = fact 9
	for i in [1..f9*(1+f9.toString().length)]
		_log.clear.darkGray i unless i%1000000
		if is_curious i
			curs.push i
	_log.clear ''
	_log curs, 'up to', i
	curs

test.curious = ->
	expect yes, !!is_curious 145
	return

test.not_curious = ->
	expect no, !!is_curious 1
	expect no, !!is_curious 2
	return

main ->
	curs = get_all_curious()
	_log.yellow curs.reduce (a,b)->a+b
	return
