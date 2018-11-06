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


