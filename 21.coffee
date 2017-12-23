{_log,test,expect,main} = require './util'

#
# note: these are not factors.
# ie. 220 -> 1,2,4,5,10,11,20,22,44,55,110
divisors = (a)->
	divs = for i in [1..a//2] when a%i is 0
		i

get_amicable_below = (below)->
	divs = for i in [0...below]
		divisors i
	#_log divs[220]
	sums = divs.map (f)->f.reduce ((a,b)->a+b), 0
	#_log sums[220]
	amics = []
	for s,i in sums when s > i
		#_log s, i
		if sums[s] is i
			amics.push [s,i]
	amics

test.amicable = ->
	expect.equal [[284,220]], get_amicable_below 285
	return

main ->
	_log amics = get_amicable_below 10000
	sum = 0
	for am in amics
		sum += am[0] + am[1]
	_log.yellow sum
	return
