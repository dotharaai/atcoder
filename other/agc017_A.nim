import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

var
  D = 1E9.int+7
  m:int = 1E6.int
  fac:seq[int]
  finv:seq[int]
  inv:seq[int]
proc comInit()=
  fac = newseqwith(m,1)
  finv = newseqwith(m,1)
  inv = newseqwith(m,1)
  for i in 2..<m:
    fac[i] = fac[i-1]*i mod D
    inv[i] = D - inv[D mod i] * (D div i) mod D
    finv[i] = finv[i-1] * inv[i] mod D

proc com(n,k:int):int=
  if  n<k:return 0
  elif n<0 or k<0: return 0
  else:
    return fac[n] * (finv[k]*finv[n-k] mod D) mod D

proc H(n,r:int):int=
  return com(n+r-1,r)

comInit()

proc solve():int=
  var
    (n,p) = (scan(),scan())
    a = newseqwith(n,scan())
  # P=0のとき
  # 偶数:2^偶数
  # 奇数:2,4,6,8...個を取る方法個
  result=1
  if p==0:
    result*=(2^(a.filterIt(it.mod(2)==0).len))
    var odd = a.filterIt(it.mod(2)==1)
    var t = 0
    for i in countup(0,odd.len,2):
      t+=com(odd.len,i)
    result*=t
  else:
    result*=(2^(a.filterIt(it.mod(2)==0).len))
    var odd = a.filterIt(it.mod(2)==1)
    var t = 0
    for i in countup(1,odd.len-1,2):
      t+=com(odd.len,i)
    result*=t



  
  
    

    
  
echo solve()