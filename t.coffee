{_log,test,expect,main} = require './util'
#
# https://projecteuler.net/problem=
#

f = (a)->
	a

test.some = ->
	expect 1, f 1
	return

main ->
	_log.yellow f 2
	return
