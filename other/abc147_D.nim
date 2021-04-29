import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt

const D = 1E9.int + 7

proc solve(n:int):int=
  var a = stdin.readLine.split.map(parseInt)
  const m = 61
  var bits = newseqwith(m,newseq[int](n+1))
  for i in 0..<m:
    var t = 2^i
    for j in 1..n:
      bits[i][j] = bits[i][j-1] + ((a[j-1] and t) > 0).int
  
  for i in 0..<m:
    var t = 2^i
    for j in 1..<n:
      
      var count1 = bits[i][n]-bits[i][j]
      
      if (a[j-1] and t) == 0:
        result+=(count1)*(t mod D)
        result = result mod D
      else:
        result+=((n-j-count1)*(t mod D))
        result = result mod D

      #echo i, ", ", j, ", ", count1, ", ", result, ", ", a[j-1] and t
  return result mod D


    
    




var n = read()

echo solve(n)