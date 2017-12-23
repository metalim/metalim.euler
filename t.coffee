{_log,test,expect,main} = require './util'

f = (a)->
	a

test.some = ->
	expect 1, f 1
	return

main ->
	_log.yellow f 2
	return
