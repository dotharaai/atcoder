import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,x,m)=(scan(),scan(),scan())
    history = initTable[int,int]()
    cum = newseq[int](1E5.int+50)
  for i in 1..n:
    #echo i, ", ", x
    cum[i]=cum[i-1] + x
    if not history.hasKey(x):
      history[x] = i
      x = (x^2).mod(m)
      
    else:
      
      # 繰り返しが発見された
      #echo cum[0..<1000]
      # 繰り返しの長さ：
      # i - history[x]
      var cycleLen = i-history[x]
      # 繰り返し一回の累積和
      var perOne = cum[i]-cum[history[x]]
      #echo "cycleLen, perOne: ", cycleLen, ", ", perOne
      result = cum[history[x]] # 繰り返しに入る前の（そんなものがあれば）累積和
      #echo result
      result += perOne * (n - history[x]).div(cycleLen)   # 繰り返しの累積和
      var last = (n - history[x]).mod(cycleLen)
      #echo result
      #echo "last:", last
      result += (cum[history[x]+last]-cum[history[x]]) #繰り返しきれない末端の累積和
      
      return
  
  return cum[n]

  




echo solve()