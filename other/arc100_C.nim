import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


var s:string


const modi = 1E9.int+7


proc solve():int=
  var n = stdin.readline.parseInt
  var a = stdin.readline.split.map(parseInt)
  
  for i in 0..<n:
    a[i] -= (i+1)
  a.sort(system.cmp)
  #echo a
  var cumL = newseq[int](n+1)
  var cumR = newseq[int](n+1)
  for i in 0..<n:
    cumL[i+1] = cumL[i]+a[i]
    cumR[i+1] = cumR[i]+a[n-i-1]
  #echo cumL
  #echo cumR
  result = int.high div 2
  for idx, b in a:
    result = min(result, 
    b*(idx-1)-(cumL[idx]  - cumL[0]) + (cumR[n-idx] - cumR[0]) - b*(n-idx-1)
    )










echo solve()