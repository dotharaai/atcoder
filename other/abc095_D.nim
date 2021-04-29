import algorithm, sequtils, strutils, math,tables, queues, macros




macro toTuple*(rhs: seq,cnt: static[int]): auto =
  let t = genSym(); result = quote do:(let `t` = `rhs`;())
  for i in 0..<cnt: result[0][1].add(quote do:`t`[`i`])





proc solve(n,c:int):int=
  var x = newseq[int](n)
  var v = newseq[int](n)
  for i in 0..<n:
    (x[i], v[i]) = stdin.readline.split.map(parseint).toTuple(2)
  

  
  var
    calClock = newseq[int](n)
    calAntiClock = newseq[int](n)

  calClock[0] = v[0] - x[0]
  calAntiClock[0] = v[n-1] - (c - x[n-1])
  for i in 1..<n:
    calClock[i] = v[i] - (x[i]-x[i-1])
    calAntiClock[i] = v[n-i-1] - (x[n-i] - x[n-i-1])
  
  var cumCalClock = newseq[int](n+1)
  var cumCalAntiClock = newseq[int](n+1)
  for i in 0..<n:
    cumCalClock[i+1] = cumCalClock[i] + calClock[i]
    cumCalAntiClock[i+1] = cumCalAntiClock[i] + calAntiClock[i]
  var 
    calClockTurn = newseq[int](n)
    calAntiClockTurn = newseq[int](n)
  calClockTurn[0] = v[0] - x[0]*2
  calAntiClockTurn[0] = v[n-1] - (c - x[n-1])*2
  for i in 1..<n:
    calClockTurn[i] = v[i] - (x[i]-x[i-1])*2
    calAntiClockTurn[i] = v[n-i-1] - (x[n-i] - x[n-i-1])*2
  var cumCalClockTurn = newseq[int](n+1)
  var cumCalAntiClockTurn = newseq[int](n+1)
  for i in 0..<n:
    cumCalClockTurn[i+1] = cumCalClockTurn[i]+calClockTurn[i]
    cumCalAntiClockTurn[i+1] = cumCalAntiClockTurn[i]+calAntiClockTurn[i]
  #echo "時計回り",cumCalClock
  #echo "反時計回り",cumCalAntiClock
  #echo "時計回りに行って戻る",cumCalClockTurn
  #echo "反時計回りに行って戻る",cumCalAntiClockTurn

  var
    clock:int = 0
    anticlock = 0
  var
    maxCumCalClock = newseqwith(n+1,0)
    maxCumCalAntiClock = newseqwith(n+1,0)
    maxCumCalClockTurn = newseqwith(n+1,0)
    maxCumCalAntiClockTurn = newseqwith(n+1,0)
  for sikii in 1..n:
    maxCumCalClock[sikii] = max(maxCumCalClock[sikii-1],cumCalClock[sikii])
    maxCumCalAntiClock[sikii] = max(maxCumCalAntiClock[sikii-1],cumCalAntiClock[sikii])
    maxCumCalClockTurn[sikii] = max(maxCumCalClockTurn[sikii-1],cumCalClockTurn[sikii])
    maxCumCalAntiClockTurn[sikii] = max(maxCumCalAntiClockTurn[sikii-1],cumCalAntiClockTurn[sikii])

  for sikii in 0..n:
    clock = maxCumCalClock[sikii]
    anticlock = maxCumCalAntiClockTurn[n-sikii]
    result = max(result, clock+anticlock)
    clock = maxCumCalAntiClock[sikii]
    anticlock = maxCumCalClockTurn[n-sikii]
    result = max(result, clock+anticlock)
  return

var (n,c) = stdin.readline.split.map(parseint).toTuple(2)
echo solve(n,c)