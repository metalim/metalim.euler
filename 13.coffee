{_log,test,expect,main} = require './util'
require('ansicolor').nice
#
# https://projecteuler.net/problem=13
#

big_sum = (a)->
	digs = []
	# sum each column
	for v in a.split '\n'
		for c,i in v.split('').reverse()
			digs[i]?=0
			digs[i] += +c
	i = 0
	# carry overflow of all cols
	while i<digs.length
		car = digs[i] // 10
		digs[i] %= 10
		if car
			digs[i+1]?=0
			digs[i+1]+=car
		++i
	digs.reverse().join ''

test.some = ->
	expect '11', big_sum '1\n10'
	expect '32392', big_sum '9934\n2583\n9999\n9876'
	return

main ->
	s=big_sum require './input/13.txt'
	_log s[...10].yellow + s[10..].darkGray
	return
