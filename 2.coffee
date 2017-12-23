{_log,test,expect,main} = require './util'

sum_even_fib_below = ( max )->
	sum = 0
	a = b = 1
	while a<=max
		sum += a unless a%2
		[a,b]=[a+b,a]
	sum

test.ten = ->
	expect 44, sum_even_fib_below 100
	return

main ->
	_log.yellow sum_even_fib_below 4000000
	return
