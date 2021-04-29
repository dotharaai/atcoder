import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


var ab:seq[int]

const D = 1E9.int+7
const m = 510000

var
  fac:seq[int]
  finv:seq[int]
  inv:seq[int]

proc getIsPrimes(n:int):seq[int] = 
  var t:seq[int] = @[]
  var r = newSeqWith(n+1,true)
  r[0]=false
  r[1]=false
  for i in 2..n.float.sqrt.int:
      if not r[i]: continue
      for j in countup(i*2,n,i):
          r[j]=false
  for i in 0..n:
    if r[i]:
      t.add(i)
  return t

const primes = getIsPrimes((3.6E5).int)

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

proc primeFact(n:int):Table[int,int]=
  result = initTable[int,int]()
  var t = n
  var d = 2
  var p = 2
  while p^2 <= n:
    if  t mod p == 0:
      result.add(p,0)
    while t mod p == 0:
      t = t div p
      result[p]+=1
    p+=1
  
  if t != 1:
    result[t]=1

proc solve(n,m:int):int=
  #echo "problem:", n, ", ",m
  if m == 1:
    return 1
  var pf = m.primeFact
  #echo pf
  result = 1
  if pf.haskey(m):
    return n
  else:
    for p in pf.keys:
      #echo p,"^", pf[p], "=>" ,H(n,pf[p]) ,", ", fac[pf[p]]
      result *= H(n,pf[p])
      result = result mod D


  return

#echo "doing"
#var t = primeFact(1E9.int)
#echo "done ",t
#echo H(3,4) == 15
#echo H(3,2) == 6
#echo solve(3,4) == 6
#echo solve(2,6) == 4
#echo solve(3,12) == 18
#echo solve(100000, 1000000000) == 957870001
#echo solve(100,7)
#echo solve(90629,433933447) == 766717452
#echo solve(47202,262703497) #== 228028790
ab = stdin.readLine.split.map(parseInt)
echo solve(ab[0],ab[1])