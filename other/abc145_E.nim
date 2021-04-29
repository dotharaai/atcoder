import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')


var
  dp1: array[6001,array[6001,int]]
  dp2: array[6001,array[6001,int]]


proc solve():int=
  var
    (n,t)=(scan(),scan())
    ab = @[(0,0)] & newseqwith(n,(scan(),scan()))
    ba = @[(0,0)] & ab.reversed()
    #ba = ab.reversed()
  #echo ab
  #echo ba
  for i in 1..n:
    for time in 0..<t:
      if time+ab[i][0]<t:
        # 時刻timeに料理iを食べる
        dp1[i][time+ab[i][0]].max=dp1[i-1][time]+ab[i][1]
      # 時刻timeに料理iを食べない
      dp1[i][time].max=dp1[i-1][time]
  for i in 1..n:
    for time in 0..<t:
      if time+ba[i][0]<t:
        # 時刻timeに料理iを食べる
        dp2[i][time+ba[i][0]].max=dp2[i-1][time]+ba[i][1]
      # 時刻timeに料理iを食べない
      dp2[i][time].max=dp2[i-1][time]


  for i in 1..n:
    for t1 in 0..<t:
      var t2 = t-t1-1
      #echo fmt"({i},{t1}):{dp1[i-1][t1]}, {dp2[n-i][t2]}, {ab[i][1]}"
      result.max = dp1[i-1][t1] + dp2[n-i][t2] + ab[i][1]
  #for d in dp1[0..5]:
    #echo d[0..70]
  #echo "==="
  #for d in dp2[0..5]:
    #echo d[0..70]

  #(2,30):10, 30, 20

  
    
  
echo solve()