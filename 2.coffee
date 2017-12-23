{_log,test,expect,main} = require './util'

sum_even_fib_max = ( max )->
	sum = 0
	a = b = 1
	while a<=max
		sum += a unless a%2
		[a,b]=[a+b,a]
	sum

test.max_ten = ->
	expect 44, sum_even_fib_max 100
	return

main ->
	_log.yellow sum_even_fib_max 4000000
	return
