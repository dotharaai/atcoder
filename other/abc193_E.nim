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

# in:
# a,b:求めたい対象
# out:
# (gcd(a,b), a*x1+b*x2=gcd(a,b)の解)

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

proc modinv(a,m:int):int=
  var (g,x,y)=xgcd(a,m)
  if g!=1:
    return -1
  else:
    return (x.mod(m)+m) mod m

#echo xgcd(-3,7)


proc crt(vr:seq[int], vm:seq[int]):(int,int)=
  if vr.len==0 or vm.len==0:return(0,0)
  var
    R = vr[0]
    M = vm[0]
  for i in 0..<vr.len:
    var
      r = vr[i]
      m = vm[i]
    if M<m:
      (M,m)=(m,M)
      (R,r)=(r,R)
    var (d,p,q)=xgcd(M,m)
    if ((r-R) mod d != 0):return(0,0)
    var
      md=m div d
      tmp = ((((r-R) div d) mod md)*p).mod(md)
    R+=M*tmp
    M*=md
    R.mod=M
    if R<0:R+=M
    return (R,M)
    

proc crt2(b:seq[int],m:seq[int]):(int,int)=
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
    xx = newseqwith(t,0)
    yy = newseqwith(t,0)
    pp = newseqwith(t,0)
    qq = newseqwith(t,0)


  proc s2(x,y,p,q:int):string=
    var
      r:int
      m:int
      res = int.high
    for ty in 0..<y:
      for tq in 0..<q:
        (r,m)=crt2(@[x+ty,p+tq],@[2*x+2*y,p+q])
        #echo (r,m)
        if m != -1:
          res.min=r
    if res==int.high:
      result = "infinity"
    else:
      result = $res



  for i in 0..<t:
    (xx[i],yy[i],pp[i],qq[i])=(scan(),scan(),scan(),scan())
  for i in 0..<t:
    echo s2(xx[i],yy[i],pp[i],qq[i])

solve()
