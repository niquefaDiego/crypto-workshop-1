require_relative 'utils'
require "test/unit/assertions"
include Test::Unit::Assertions

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

test_gcd()
test_inv()
test_power_mod()
test_split_and_join()

