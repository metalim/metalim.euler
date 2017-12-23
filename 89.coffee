{_log,test,expect,main} = require './util'
#
# https://projecteuler.net/problem=89
#

roman =
	I: 1
	IV: 4
	V: 5
	IX: 9
	X: 10
	XL: 40
	L: 50
	XC: 90
	C: 100
	CD: 400
	D: 500
	CM: 900
	M: 1000


from_roman = (s)->
	n = 0
	i = 0
	while i<s.length
		s2 = s[i..i+1]
		switch
			when roman[s2]?
				n += roman[s2]
				++i
			when roman[s[i]]?
				n += roman[s[i]]
			else
				return
		++i
	n

roman_desc = ([k,v] for k,v of roman).reverse()

to_roman = (n)->
	s = ''
	for [k,v] in roman_desc
		while n>=v
			s+=k
			n-=v
	s

get_excess_delta = (rs)->
	d = 0
	for r in rs.split '\n'
		d += r.length
		r = to_roman from_roman r
		d -= r.length
	d


test.from_roman = ->
	expect 16, from_roman 'XIIIIII'
	expect 16, from_roman 'XVI'
	expect 4, from_roman 'IV'
	expect 1, from_roman 'I'
	expect undefined, from_roman 'IZ'
	expect undefined, from_roman 'Z'
	return

test.to_roman = ->
	expect 'XIX', to_roman 19
	expect 'XXI', to_roman 21
	expect 'XLIX', to_roman 49
	return

test.get_excess_delta = ->
	expect 4, get_excess_delta 'XIIIIII'
	return

main ->
	_log.yellow get_excess_delta require './input/p089_roman.txt'
	return
