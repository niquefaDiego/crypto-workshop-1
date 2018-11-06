require "test/unit/assertions"
include Test::Unit::Assertions

def gcd(a,b)
  return [1, 0, a] if b == 0
  y, x, d = gcd(b,a%b)
  [x, y-x*(a/b), d]
end

def eqclass(a,m)
  ((a%m)+m)%m
end

def inv(a,m)
  x, y, d = gcd(m,a)
  eqclass(y,m)
end

def power_mod(b, e, m)
  r = 1
  while e > 0 do
    r = (r*b)%m if (e&1) > 0
    b = (b*b)%m
    e >>= 1
  end
  r
end

def split_with_base(n,b,t)
  r = []
  t.times do
    r <<= n%b
    n /= b
  end
  r
end

def join_with_base(n,b)
  r = 0
  n.reverse.each { |d| r = r*b + d }
  return r
end

def test_gcd()
  cases = [ [12, 20], [0, 12], [3, 2], [60, 90] ]
  for a, b in cases do
    x, y, d = gcd(a,b)
    #puts "#{x}*#{a} + #{y}*#{b} = #{d}"
    assert( d == a.gcd(b), "GCD is wrong" )
    assert( x*a + y*b == d, "(x,y) is wrong" )
  end
  puts "GCD works"
end

def test_inv()
  cases = [ [2, 7], [ 9, 10 ], [ 100, 10**9+21 ] ]
  for x, m in cases do
    y = inv(x,m)
    assert( (x*y)%m == 1, "inv of #{x} mod #{m} is not #{y}" )
  end
  puts "inv works"
end

def test_power_mod()
  cases = [ [ 2, 9, 1000, 512 ], [ 10, 1000, 203, 123 ] ]
  for b, e, m, r in cases do
    r1 = power_mod(b,e,m)
    assert( r == r1, "power_mod(#{b},#{e},#{r}) = #{r1}, expected #{r}" )
  end
  puts "power_mod works"
end

def test_split_and_join()
  cases = [ [ 1000002032341234, 14 ], [ 12341234, 15] ]
  for n, b in cases do
    splitted = split_with_base(n,b,100)
    joined = join_with_base(splitted,b)
    assert( n == joined, "failed: n=#{n}, b=#{b}, splitted=#{splitted}, joined=#{joined}" )
  end
  puts "split and join works"
end

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

test_gcd()
test_inv()
test_power_mod()
test_split_and_join()
solve()
