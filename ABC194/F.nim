import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


#type hex = enum
  

proc solve():int=
  var
    n = "2A".repeat(10^5)#read()
    k = 10#scan()
    v = n.toSeq()
    a = @[0] & v.mapIt(($it).parseHexInt)
    D = 10^9+7
    dp = newseqwith(n.len+1,
      newseqwith(16,
      newseqwith(2,
      newseqwith(2,0))))
  
  for i in 1..n.len:
    for k in 0..15:
      echo fmt"{i}, {k}"
      # 未満が確定せずkが使われていない
      if a[i]!=k:
        dp[i][k][0][0] = dp[i-1][k][0][0]
      else:
        # a[i]==kのときは存在し得なくなる
        dp[i][k][0][0] = 0

      # 未満が確定していてkが使われていない
      dp[i][k][0][1] = dp[i-1][k][0][1]*14  # i-1桁目までで確定していたとき
      if a[i]>k:
          dp[i][k][0][1]+=dp[i-1][k][0][0]*(a[i]-1)  # k以外でa[i]未満の数字の個数
      elif a[i]==k:
        dp[i][k][0][1] += dp[i-1][k][0][0]*(a[i])  # k以外でa[i]未満の数字の個数


      # 未満が確定せずkが使われている
      if a[i]==k:
        dp[i][k][1][0] = dp[i-1][k][0][0]+dp[i-1][k][1][0]
      else:
        dp[i][k][1][0] = dp[i-1][k][1][0]
      # 未満が確定していてkが使われている
      dp[i][k][1][1] = dp[i-1][k][0][1]+
        dp[i-1][k][1][1]*15 + 
        dp[i-1][k][1][0] * (a[i])
      if a[i]>k:
        dp[i][k][1][1]+=dp[i-1][k][0][0]
      dp[i][k][0][0].mod=D
      dp[i][k][0][1].mod=D
      dp[i][k][1][0].mod=D
      dp[i][k][1][1].mod=D
    


        




  
echo solve()

