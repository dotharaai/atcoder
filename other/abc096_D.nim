import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
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



const primes = getIsPrimes(55555).filterIt((it-1) mod 5 == 0)


proc read:int = get().parseInt

var n = read()
  
proc solve(n):string=
  result = $primes[0]
  for i in 1..<n:
    result = result & " " & $primes[i]

echo solve(n)