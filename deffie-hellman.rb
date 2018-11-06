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


puts "1. A y B acuerdan en el generador g=#{g} en Zp, con p=#{p}"
puts "2. A escoge el entero aleatorio secreto x (1 <= x <= p-2), x=#{x}"
puts "3. B escoge el entero aleatorio secreto y (1 <= y <= p-2), y=#{y}"
X = power_mod(g,x,p)
puts "4. A calcula X = g^x mod p = #{X}"
Y = power_mod(g,y,p)
puts "5. B calcula Y = g^y mod p = #{Y}"
puts "6. A envía X a B y B envía Y a A"
kA = power_mod(Y,x,p)
puts "7. A calcula k=Y^x mod p = #{kA}"
kB = power_mod(X,y,p)
puts "8. A calcula k=X^y mod p = #{kB}"
assert(kA==kB, "Deffie-Hellam failed")
puts "9. k=#{kA} es la llave criptográfica para esta sesión de comunicaciones"


