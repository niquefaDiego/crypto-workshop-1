require_relative 'utils'
require "test/unit/assertions"
include Test::Unit::Assertions

def rsa(m, e, n)
  c = []
  m.each { |mi| c <<= power_mod(mi,e,n) } 
  c
end

def solve()

  p = 47
  q = 71
  e = 79
  m = 6882326879666683
  t = 6

  puts "----- Solution -----"
  puts "p = #{p}"
  puts "q = #{q}"
  puts "e = #{e}"
  puts "message = #{m}"
  puts "t = #{t}"

  n = p*q
  phi = (p-1)*(q-1)
  puts "n = pq = #{p}*#{q} = #{n}"
  puts "phi = (p-1)(q-1) = #{p-1}*#{q-1} = #{phi}"

  e = 0
  while e.gcd(phi) != 1 do
    e = Random.rand(2..phi-1) 
  end

  puts "Randomly chosen: e = #{e}"
  d = inv(e,phi)
  puts "d = #{d}"

  puts "Public key: (#{e},#{n})"
  puts "Private key: (#{d},#{n})"

  arr_m = split_with_base(m,n,t)
  puts "Splitted m: #{arr_m}"

  arr_c = rsa(arr_m,e,n)
  puts "encrypted message = #{arr_c}"

  arr_m1 = rsa(arr_c,d,n)
  puts "decrypted message = #{arr_m1}"

  m1 = join_with_base(arr_m1,n)
  puts "joined decrypted message = #{m1}"

  assert( m == m1, "RSA failed" )

end

solve()
