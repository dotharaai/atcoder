import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


# combination
# コンビネーションの計算
const
  D = 3
  m:int = 1E6.int
  #fac:seq[int]
  #finv:seq[int]
  #inv:seq[int]
proc comInit():(seq[int],seq[int],seq[int])=
  var
    fac = newseqwith(m,1)
    finv = newseqwith(m,1)
    inv = newseqwith(m,1)
  for i in 2..<m:
    fac[i] = fac[i-1]*i mod D
    inv[i] = D - inv[D mod i] * (D div i) mod D
    finv[i] = finv[i-1] * inv[i] mod D
  return (fac,finv,inv)

const (fac,finv,inv) = comInit()


proc com(n,k:int):int=
  if  n<k:return 0
  elif n<0 or k<0: return 0
  else:
    return fac[n] * (finv[k]*finv[n-k] mod D) mod D

proc H(n,r:int):int=
  return com(n+r-1,r)



proc solve()=
  var 
    n = scan()
    c = read().replace("R","0").replace("B","1").replace("W","2")
    v = 0
  for i in 0..<n:
    v += c[i].toInt * com(n-1,i)
    v.mod=3
  if v.mod(3)==0:
    echo "R"
  elif v.mod(3)==2:
    echo "B"
  elif v.mod(3)==1:
    echo "W"



solve()