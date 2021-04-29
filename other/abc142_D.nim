import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt


proc getIsPrimes(n:int):seq[bool]=
    result = newSeqWith(n+1,true)
    result[1] = false
    result[0] = false
    for i in 2..n.float.sqrt.int:
        if not result[i]:continue
        for j in countup(i*2,n,i):
            result[j] = false


    
var isPrime:seq[bool] = getIsPrimes(2E6.int)

proc primeFact(n:int):Table[int,int]=
  result = initTable[int,int]()
  result[1] = 1
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




proc solve(a,b:int):int=
  var g = gcd(a,b)
  var r = g.primeFact
  #echo r
  return r.len


var a,b = read()
#var a = 1E12.int
#var b = 1E12.int
echo solve(a,b)