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
    n = newseqwith(t,0)
    s = newseqwith(t,0)
    k = newseqwith(t,0)
  for i in 0..<t:
    (n[i],s[i],k[i]) = (scan(),scan(),scan())

  proc slv(n,s,k:int):int=
    var
      (r,m)=crt(@[-s,0],@[n,k])
    if m != -1:
      return r div k
    else:
      return -1
      
  for i in 0..<t:
    echo slv(n[i],s[i],k[i])

    
  

  
solve()