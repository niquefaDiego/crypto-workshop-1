require_relative 'utils'
require 'test/unit/assertions'
include Test::Unit::Assertions

g = 7
p = 23
x = 5
y = 8

puts "g=#{g}"
puts "p=#{p}"
puts "x=#{x}"
puts "y=#{y}"


z = 13
puts "1. E escoge el exponente z = 13"

Z = power_mod(g,z,p)
puts "2. E calcula Z = PowerMod(g,z,p)"

X = power_mod(g,x,p)
Y = power_mod(g,y,p)
puts "3. E intercepta X y Y"
puts "4. E envía Z a A y a B"

k1 = power_mod(X,z,p)
k2 = power_mod(Y,z,p)
puts "5. E calcula k1 = PowerMod(X,Z,p) = #{k1} y k2 = PowerMod(Y,Z,p) = #{k2}"

k1A = power_mod(Z,x,p)
puts "6. A calcula k1=PowerMod(Z,x,p) = #{k1A}"

k2B = power_mod(Z,y,p)
puts "7. B calcula k2=PowerMod(Z,y,p) = #{k2B}"

assert(k1==k1A,"#{k1} should be #{k1A}")
assert(k2==k2B,"#{k2} should be #{k2B}")

