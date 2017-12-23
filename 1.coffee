{_log,test,expect,main} = require './util'

sum_below = (a)->
	sum = 0
	for i in [1...a] when i%3 is 0 or i%5 is 0
		sum += i
	sum

test.below_ten = ->
	expect 23, sum_below 10
	return

main ->
	_log.yellow sum_below 1000
	return
