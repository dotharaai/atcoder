import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



# combination
# コンビネーションの計算
const
  D = 998244353
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


proc solve():int=
  #echo "ready"
  var
    (n,m)=(scan(),scan())
    bitm = 14
    bm = m.toBin(bitm)
    memo = initTable[(int,int),int]()
  

  proc dfs(s:int,last=0):int=
    if s == bitm:
      if last>0:
        return 0
      else:
        return 1
    if memo.hasKey((s,last)):
      return memo[(s,last)]
    var bits = last
    if bm[s]=='1':
      bits+=1
    for use in countup(0,min(bits,n),2):
      result+=com(n,use)*dfs(s+1,(bits-use)*2)
      result.mod=D
    memo[(s,last)]=result
  return dfs(0).mod(D)
    

echo solve()