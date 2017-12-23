{_log,test,expect,main} = require './util'
#
# https://projecteuler.net/problem=5
#

gcd = (a,b)->
	[b,a]=[a,b] if a<b
	while b
		[a,b]=[b,a%b]
	a

lcm_brute = (a)-> #stupid and slow for >20
	i = 0
	div = no
	while not div
		++i
		div = yes
		for j in [2..a] when i%j
			div = no
			break
	i

lcm = (a)->
	v = 1
	for i in a
		v = v * i / gcd v, i
	v

test.brute = ->
	expect 2520, lcm_brute 10
	return

test.gcd = ->
	expect 2, gcd 6,8
	return

test.lcm = ->
	expect 2520, lcm [1..10]
	expect 2329089562800, lcm [1..30]
	return

main ->
	_log.yellow lcm [1..20]
	return
