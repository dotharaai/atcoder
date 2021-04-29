import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



# combination
# コンビネーションの計算
var
  D = 998244353
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

proc primes(n:int):Table[int,int]=
  result = initTable[int,int]()
  var
    d = 2
    n = n
  while d^2<=n:
    if n.mod(d)==0:
      var ex = 0
      while n mod d == 0:
        ex+=1
        n = n.div(d)
      result[d] = ex
    d+=1
  if n!=1:
    result[n]=1
    


proc getVal():seq[Table[int,int]]=
  for i in 0..2*10^5:
    result.add(primes(i))
    
var ps = getVal()

#echo "ready"
proc solve():int=
  var 
    n = scan()
    m = scan()
    p = 998244353


  for i in 1..m:
    # 初期値をiとして、n-1個の仕切りのどこかで素因数で割るか割らないか
    var t = 1
    for (k, v) in ps[i].pairs():
      #echo fmt"{v} : {com(n+v,v)}"
      t*=com(n+v-1,v)
      t.mod=p
    #echo fmt"{i}: result:{t}"
    result+=t
    result.mod=p
    



  
echo solve()