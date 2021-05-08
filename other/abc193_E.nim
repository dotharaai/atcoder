import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



# 拡張ユークリッド互除法

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

# modの逆元
proc modinv(a,m:int):int=
  var (g,x,y)=xgcd(a,m)
  if g!=1:
    return -1
  else:
    return x mod m

# 中国剰余定理
# return
# r: 答え
# m: lcm(m)
proc crt(b:seq[int],m:seq[int]):(int,int)=
  var
    r=0
    M=1
  for i in 0..<b.len:
    var (d,p,q)=xgcd(M,m[i])
    if ((b[i]-r)mod d) != 0:return (0,-1)
    var tmp = (b[i]-r) div d * p mod (m[i] div d)
    r+=M*tmp
    M*=m[i] div d
  if r<0:
    r+=M
  r.mod=M

  return (r,M)


proc solve()=
  var
    t = scan()
    cases = newseqwith(t,(scan(),scan(),scan(),scan()))
  for (x,y,p,q) in cases:
    var
      result = int.high.div(4)
      fnd = false
    for yi in 0..<y:
      for qi in 0..<q:
        var (r,m) = crt(@[x+yi,p+qi],@[2*(x+y),p+q])
        if m != -1:
          fnd = true
          result.min=r
    if not fnd:
      echo "infinity"
    else:
      echo result
          



  

  
solve()