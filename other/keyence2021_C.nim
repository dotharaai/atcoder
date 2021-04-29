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


proc modpow(x,n,m:int):int=
  result = 1
  for i in 0..<n:
    result*=x
    result.mod=m


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
    return x mod m





var
  dp: array[5002,array[5002,int]]
  d:array[5002,array[5002,string]]

proc solve():int=
  var
    (h,w,k)=(scan(),scan(),scan())
    blank = h*w-k
    
    #dp = newseqwith(h+2,newseqwith(w+2,0))
    #d = newseqwith(h+1,newseqwith(w+1,""))
    dv = 998244353
    d3 = modinv(3,dv)
  
  for i in 0..<k:
    var (y,x,c)=(scan(),scan(),read())
    d[y][x]=c
  dp[1][1]=modpow(3,blank,dv)
  for y in 1..h:
    for x in 1..w:
        dp[y][x].mod=dv
        if d[y][x]=="":
          dp[y][x+1]+=(dp[y][x]*2)*d3
          dp[y+1][x]+=(dp[y][x]*2)*d3
        elif d[y][x]=="D":
          dp[y+1][x] += dp[y][x]#.div(3)
        elif d[y][x]=="R":
          dp[y][x+1] += dp[y][x]#.div(3)
        else:
          dp[y][x+1] += dp[y][x]#.div(3)
          dp[y+1][x] += dp[y][x]#.div(3)
  
  result = dp[h][w].mod(dv)
  

  
    
  
echo solve()