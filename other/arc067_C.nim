import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


proc getIsPrimes(n:int):seq[bool]=
    result = newSeqWith(n+1,true)
    result[1] = false
    result[0] = false
    for i in 2..n.float.sqrt.int:
        if not result[i]:continue
        for j in countup(i*2,n,i):
            result[j] = false




const isPrime:seq[bool] = getIsPrimes(1E4.int)

proc getPrimes(n:int):seq[int]=
  for i,v in isPrime:
    if v:
      result.add(i)

const primes:seq[int] = getprimes(1E3.int)


var factor = initTable[int,int]()

proc c(n:int)=
  var v = n
  for i in primes:
    if i > v:
      break
    while v.mod(i) == 0:
      if factor.hasKeyOrPut(i,1):
        factor[i]+=1
      v = v.div(i)


proc solve():int=
  var
    n = scan()
  for i in countdown(n,1):
    c(i)
  result=1
  for k,v in factor.pairs():
    result= (result*(v+1)).mod(1E9.int+7)
    


    
  
echo solve()