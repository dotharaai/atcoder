import strutils, sequtils, algorithm

proc solve(n,p:int,s:string):int=
  var memo = newSeqWith(n,0)
  memo[0] = s[0..0].parseInt.mod(p)
  for i in 1..<n:
    memo[i] = (memo[i-1]*10+s[i..i].parseInt).mod(p)
  

  
  return
  



var
  n:int
  p:int
  s:string


var np = stdin.readline().split(" ").mapIt(it.parseInt)

n = np[0]
p=np[1]
s = stdin.readline()