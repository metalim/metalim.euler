{_log,test,expect,main} = require './util'
big = require 'big-integer'
#
# https://projecteuler.net/problem=55
#

pal = (a)->
	big a.toString().split('').reverse().join ''

is_pal = (a)->
	a.eq pal a

is_lychrel = (a)->
	for [1..60]
		a = a.add pal a
		if is_pal a
			return no
	yes

get_lychrels_below = (below)->
	i for i in [1...below] when is_lychrel big i

test.pal = ->
	expect '987654321', String pal big '123456789'
	expect '987654321987654321', String pal big '123456789123456789'
	expect yes, is_pal big '1234567890987654321'
	return

test.not_lychrel = ->
	expect no, !!is_lychrel big[47]
	expect no, !!is_lychrel big[349]
	expect no, !!is_lychrel big[11]
	expect no, !!is_lychrel big[1]
	expect no, !!is_lychrel big 10677
	return

test.is_lychrel_196 = ->
	expect yes, !!is_lychrel big[196]
	return

test.is_lychrel_4994 = ->
	expect yes, !!is_lychrel big 4994
	return

main ->
	ls = get_lychrels_below 10000
	_log.yellow ls.length
	return
