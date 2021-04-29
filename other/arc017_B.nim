import strutils,algorithm, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt
const inf = high(int) div 4

proc solve():int=
  var n, k = read()
  var perf = newseqwith(n,0)
  var renzoku = newseq[int](0)
  perf[0] = stdin.readline.parseInt
  var cont = 1
  for i in 1..<n:
    perf[i] = stdin.readline.parseInt
    if perf[i] > perf[i-1]:
      cont+=1
      if i == n-1:
        renzoku.add(cont)
    else:
      renzoku.add(cont)
      cont = 1
  #echo renzoku
  for r in  renzoku:
    result += max(0,r - k + 1)



  
  
  

echo solve()