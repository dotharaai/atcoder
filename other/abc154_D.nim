import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc solve(n:int,k:int):float=
  #var dices = stdin.readLine.split.mapIt((it.parsefloat+1)/2)
  var n = 200000
  var k = 100000
  var dices = newseqwith(n,3.0)

  #var dices = stdin.readLine.split.mapIt((it.parseInt)
  echo "prepare"
  #for i in 0..<k:
    #t += dices[i]
  var t = dices[0..k-1].foldl(a+b)
  echo "done"
  result = t
  for i in 0..<n-k:
    t = t - dices[i] + dices[i+k]
    result = max(result, t)
  return 


var (n, k) = (1,3)#read()

echo solve(n,k)