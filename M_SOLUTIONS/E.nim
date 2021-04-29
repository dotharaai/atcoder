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
    n = scan()
    x = newseq[int](n)
    y = newseq[int](n)
    p = newseq[int](n)
    cost = newseq[int](n)
    distance = newseq[int](n)
  for i in 0..<n:
    (x[i], y[i],p[i]) = (scan(),scan(),scan())
    distance[i] = min(abs(x[i]),abs(y[i]))
    cost[i] = p[i]*distance[i]
  echo cost
  echo sum(cost) # 鉄道が１本もないときのコスト
  for i in 1..n:
    # n本
    for town in 0..<n:
      if cost[town] == max(cost):# コスト最大の集落を選択
        distance[town] = 0
        cost[town] = 0
        # 集落のxおよびy座標に鉄道を敷いたときにコストが下がるものを一時的に更新
        # 縦横があるので二通り試す
        
        var tatecost = 0
        var yokocost = 0
        for neighbortown in 0..<n:
          if distance[neighbortown] > abs(y[neighbortown]-y[town]):
            tatecost+=p[neighbortown]*abs(y[neighbortown]-y[town])
          if distance[neighbortown] > abs(x[neighbortown]-x[town]):
            yokocost+=p[neighbortown]*abs(x[neighbortown]-x[town])
        if tatecost<yokocost:
          for neighbortown in 0..<n:
            distance[neighbortown].min=abs(y[neighbortown]-y[town])
            cost[neighbortown]=distance[neighbortown]*p[neighbortown]
        else:
          for neighbortown in 0..<n:
            distance[neighbortown].min=abs(x[neighbortown]-x[town])
            cost[neighbortown]=distance[neighbortown]*p[neighbortown]
        break
      echo sum(cost)


          
        




  # n=15のときは2**15=32768通り程度
  # 経路が多いかも
  # 鉄道を渡すとき、集落の上に渡さない必要はない（多分）
  # 全部試してもよい？
  
    

    
  
echo solve()