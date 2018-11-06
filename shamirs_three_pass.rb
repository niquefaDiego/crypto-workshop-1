require_relative 'utils'
require 'prime'
require 'test/unit/assertions'
include Test::Unit::Assertions

p = 10**9+21

assert( Prime.prime?(p), "p=#{p} must be prime" )

puts "(A) Configuración de primera vez"
puts "1. Publicar primo p=#{p}"

a = 0
b = 0
while ( a.gcd(p-1) != 1 ) do a = Random.rand(1..p-2) end
while ( b.gcd(p-1) != 1 ) do b = Random.rand(1..p-2) end

a_inv = inv(a,p-1)
b_inv = inv(b,p-1)
assert( (a*a_inv)%(p-1) == 1, "#{a_inv} is not the inv of #{a} mod #{p-1}")
assert( (b*b_inv)%(p-1) == 1, "#{b_inv} is not the inv of #{b} mod #{p-1}")

puts "2. a=#{a}, b=#{b}, a_inv=#{a_inv} y b_inv=#{b_inv}"

puts "(B) Protocol"

k = Random.rand(1..p-1)
puts "1. A escoge la llave aleatoria secreta k=#{k}"

k1 = power_mod(k,a,p)
puts "2. A envía k1=PowerMod(k,a,p)=#{k1} a B"

k2 = power_mod(k1,b,p)
puts "3. B envía k2=PowerMod(k1,a,p)=#{k2} a A"

k3 = power_mod(k2,a_inv,p)
puts "4. A envía k3=PowerMod(k2,a_inv,p)=#{k3} a B"

kB = power_mod(k3,b_inv,p)
puts "5. B calcula k=PowerMod(k3,b_inv,p)=#{kB}"

puts ( (a*b*a_inv*b_inv)%p )
assert( k == kB, "A and B's keys differ")
