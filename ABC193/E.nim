import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc xgcd(a,b:int):(int,int,int)=
  var
    b = b
    x0=1
    y0=0
    x1=0
    y1=1
    q:int
    a = a
  while b!=0:
    (q,a,b) = (a.div(b),b,a.mod(b))
    (x0,x1)=(x1,x0-q*x1)
    (y0,y1)=(y1,y0-q*y1)
  return (a,x0,y0)



proc solve()=
  var 
    t = scan()
    
  for i in 0..<t:
    var (X,Y,P,Q)=(scan(),scan(),scan(),scan())
    var res = int.high.div(2)
    for y in 0..<Y:
      var (g,n1,n2) = xgcd(2*X+2*Y, (-P-Q))
      if (P-X-y).mod(g)!=0:
        continue
      else:
        n1*=(P-X-y).div(g)
        n2*=(P-X-y).div(g)
  
        res.min=(P+Q)*n2+P
        #echo fmt"{2*X+2*Y}*{n1}+({-P-Q})*{n2} = {P-X-y}"
      
    for q in 0..<Q:
      var (g,n1,n2) = xgcd(2*X+2*Y, (-P-Q))
      if (P-X+q).mod(g)!=0:
        continue
      else:
        n1*=(P-X+q).div(g)
        n2*=(P-X+q).div(g)
        res.min=(P+Q)*n2+P
        #echo fmt"{2*X+2*Y}*{n1}+({-P-Q})*{n2} = {P-X-q}"
    if res==int.high.div(2):
      echo "infinity"
    else:
      


solve()