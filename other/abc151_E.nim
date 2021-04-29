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


# combination
# コンビネーションの計算
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
    (n,k)=(scan(),scan())
    a = newseqwith(n,scan()).sorted(SortOrder.Ascending)
    maxk=0
    mink=0
  for idx,v in a:
    maxk+=com(idx,k-1)*v
    mink += com(n-idx-1,k-1)*v
    maxk.mod=D
    mink.mod=D
    #echo com(idx,k-1), ", ",com(n-idx-1,k-1)
  return (maxk-mink+10*D).mod(D)


  
  
    

    
  
echo solve()