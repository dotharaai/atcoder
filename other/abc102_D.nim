import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt


proc solve(n:int):int=
  var a = stdin.readline.split.map(parseInt)
  var cum = newseq[int](n+1)
  for i in 0..<n:
    cum[i+1] = cum[i] + a[i]
  # cum: 0..n
  # cum[1] - cum[0] = a0
  var sikii1 = 1
  var sikii3 = 3
  result = int.high - 5
  for sikii2 in 2..<n:
    while sikii1+1 < sikii2:
      if abs((cum[sikii1] - cum[0])  - (cum[sikii2] - cum[sikii1])) > abs((cum[sikii1+1] - cum[0])  - (cum[sikii2] - cum[sikii1+1])):
        sikii1+=1
      else:
        break
    while sikii3 < n:
      if abs((cum[n] - cum[sikii3])  - (cum[sikii3] - cum[sikii2])) > abs((cum[n] - cum[sikii3+1])  - (cum[sikii3+1] - cum[sikii2])):
        sikii3+=1
      else:
        break
    result = min(result, 
    abs(max(@[
      (cum[n]-cum[sikii3]),(cum[sikii3]-cum[sikii2]),(cum[sikii2]-cum[sikii1]),(cum[sikii1]-cum[0])
    ]) - min(@[
      (cum[n]-cum[sikii3]),(cum[sikii3]-cum[sikii2]),(cum[sikii2]-cum[sikii1]),(cum[sikii1]-cum[0])
    ]) )
    )

  # 一つ左の閾が右に一つずれるとその閾値の右の値は小さくなる->閾値を一つずらすかずらさないかを一つ先読みして決める

  



var n = stdin.readline.parseInt
echo solve(n)