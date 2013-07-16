#!/usr/bin/ruby

def pow(x,y)
  return 1 if y == 0
  return x if y == 1
  out = pow(x*x, y/2)
  out *= x if y%2 == 1
  return out 
end


def pow2(x,y)
  return 1 if y == 0
  return x if y == 1
  return pow2(x*x, y/2) * (y%2 == 1 ? x : 1)
end
p pow(ARGV[0].to_i,ARGV[1].to_i)
