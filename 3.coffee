{_log,test,expect,main} = require './util'

factor = (a)->
	fac = []
	i = 2
	sqrt = Math.floor Math.sqrt a
	while i <= sqrt and a > 1
		if a%i
			++i
		else
			a /= i
			fac.push i
			sqrt = Math.floor Math.sqrt a
	fac.push a if a>1
	fac

test[13195] = ->
	expect.equal [5,7,13,29], factor 13195
	expect.equal 29, Math.max factor(13195)...
	return

main ->
	_log.cyan factor 600851475143
	_log.yellow Math.max factor(600851475143)...
	return
