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


    
var isPrime:seq[bool] = getIsPrimes(1E5.int)


proc get2017like(m:int):seq[int]=
  result = newseqwith(m+1,0)
  var count = 0
  for i in 1..m:
    if (i mod 2 == 1) and isPrime[i] and isPrime[((i+1) div 2)]:
      count+=1
    result[i] = count


var t2017:seq[int] = get2017like(1E5.int)


proc solve(q:int,t2017:seq[int])=
  for i in 0..<q:
    var lr = stdin.readLine.split.map(parseInt)
    echo t2017[lr[1]] - t2017[lr[0]-1]

var
  q = read()

solve(q,t2017)