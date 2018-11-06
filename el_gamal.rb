require_relative 'utils'
require 'test/unit/assertions'
include Test::Unit::Assertions

def solve()

  p = 2579
  alpha = 2
  a = 765
  m = 1299
  t = 1
  k = 853

  puts "----- Solution -----"
  puts "p = #{p}"
  puts "alpha = #{alpha}"
  puts "a = #{a}"
  puts "m = #{m}"
  puts "t = #{t}"
  puts "k = #{k}"

  beta = power_mod(alpha, a, p)
  puts "beta = #{beta}"

  puts "Public key: (p,alpha,beta) = (#{p},#{alpha},#{beta})"

  puts "Secret key: a = #{a}"

  k = Random.rand(1..p-2)

  gamma = power_mod(alpha,k,p)
  delta1 = power_mod(beta,k,p)
  delta = ( m * delta1 ) % p

  puts "gamma_1 = #{gamma}"
  puts "delta1_1 = #{delta1}"
  puts "delta_1 = #{delta}"

  c = [ gamma, delta ]
  puts "cipher_text_1 = #{c}"

  p1 = p - 1 - a
  puts "p1 = p - 1 - a = #{p} - 1 - #{a} = #{p1}"
  m1 = power_mod(gamma,p1,p)
  puts "m1_1 = #{m1}"

  m1 = ( delta * m1 ) % p

  puts "dechiphered text = #{m1}"

  assert( m == m1, "el_gamal failed")

end

solve()
