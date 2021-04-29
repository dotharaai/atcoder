import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

# 根をKとした場合の距離を求める：O(n)
# 閉路がない＝ルートが１通りしかない
const inf = high(int) div 4


var
  n = stdin.readLine.parseInt
  a = newseq[int](n)
  b = newseq[int](n)
  c = newseq[int](n)
  costFromRootRec = initTable[int,int]()
  costFromRoot = initTable[int,int]()
  #costFromRoot:array[1E5.int,int]
  #newseqwith(n,inf)
  edges = newseqwith(n,newseq[int](0))
  costs = newseqwith(n,newseq[int](0))

for i in 0..<n-1:
  #var abc = @[1,i+2,2] # 放射状のケース
  #var abc = @[i+1,i+2,2] # 直鎖上のケース
  var abc = stdin.readLine.split.map(parseInt)
  #echo i
  #(a[i],b[i],c[i]) = (abc[0]-1,abc[1]-1,abc[2])
  edges[abc[0]-1].add(abc[1]-1)
  costs[abc[0]-1].add(abc[2])
  edges[abc[1]-1].add(abc[0]-1)
  costs[abc[1]-1].add(abc[2])

var
  qk = stdin.readLine.split.map(parseInt)
  #qk = @[n-2, 1] #@[1E5.int-2, 1] 
  
  qx = newseq[int](qk[0])
  qy = newseq[int](qk[0])

for i in 0..<qk[0]:
  var xy = stdin.readLine.split.map(parseInt)
  #var xy:seq[int]
  (qx[i],qy[i]) = (xy[0]-1,xy[1]-1)


#echo edges
costFromRoot[qk[1]-1] = 0
#echo costs
costFromRootRec[qk[1]-1] = 0

proc calcCosts(start:int)=
  costFromRoot[start] = 0
  var froms = initQueue[int](initialSize=2^17)
  var nexts = initQueue[int](initialSize=2^17)
  var nextcosts = initQueue[int](initialSize=2^17)
  for idx, edge in edges[start]:
    froms.add(start)
    nexts.add(edge)
    nextcosts.add(costs[start][idx])

  while nexts.len > 0:
    var
      f   = froms.dequeue()
      ne = nexts.dequeue()
      nc = nextcosts.dequeue()
    costFromRoot[ne] = costFromRoot[f] + nc
    for idx, edge in edges[ne]:
      if not costFromRoot.haskey(edge):
        froms.add(ne)
        nexts.add(edge)
        nextcosts.add(costs[ne][idx])



proc calcCostsRec(before:int)=
  var nexts = edges[before]
  var nextcosts = costs[before]
  
  for idx, nextnode in nexts:
    if not costFromRootRec.haskey(nextnode):
      costFromRootRec[nextnode] = costFromRootRec[before] + nextcosts[idx]
      calcCostsRec(nextnode)

calcCosts(qk[1]-1)
#echo "done"
#calcCostsRec(qk[1]-1)
#echo costFromRoot == costFromRootRec
for i in 0..<qk[0]:
  echo costFromRoot[qx[i]] + costFromRoot[qy[i]]
#echo solve()
#var res = solveRec(0,0,0,0)
#if res==inf:
  #echo -1
#else:
  #echo res
#echo solveRec(0,0,0,0)