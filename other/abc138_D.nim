import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt
  
proc solve(n,q:int)=
  var edgeT = newseqwith(n,newseq[int](0))
  var nodeC = newseqwith(n,0)
  var cumNodeC = newseqwith(n,-1)
  cumNodeC[0] = 1
  for i in 0..<n-1:
    var ab = stdin.readLine.split.map(parseInt)
    edgeT[ab[0]-1].add(ab[1]-1)
    edgeT[ab[1]-1].add(ab[0]-1)
  for i in 0..<q:
    var px = stdin.readLine.split.map(parseInt)
    nodeC[px[0]-1] += px[1]
  var que = initQueue[int]()
  que.enqueue(0)
  cumNodeC[0] = nodeC[0]
  #echo nodeC
  while que.len != 0:
    var now = que.dequeue()
    
    var nexts = edgeT[now]
    #echo now,", ", que,", ", nexts
    for next in nexts:
      if cumNodeC[next] != -1:
        continue
      else:
        cumNodeC[next] = cumNodeC[now] + nodec[next]
        que.enqueue(next)
  for i in 0..<n-1:
    stdout.write cumNodeC[i]
    stdout.write " "
  echo cumNodeC[n-1]





  




var n,q = read()

solve(n,q)