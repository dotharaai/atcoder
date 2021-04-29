import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
 
proc read:int = get().parseInt


proc solve(n:int)=
  var edges = newseqwith(n,newseq[int](0))
  var edgenum = newseqwith(n,newseq[int](0))
  var edgecolor = newseqwith(n-1,-1)

  for i in 0..<n-1:
    var ab = stdin.readLine.split.map(parseInt)
    edges[ab[0]-1].add(ab[1]-1)
    edges[ab[1]-1].add(ab[0]-1)
    edgenum[ab[0]-1].add(i)
    edgenum[ab[1]-1].add(i)
  
  #echo edges
  #echo edgenum
  var usecolor = edges.mapIt(it.len).max()
  var que = initQueue[int]()
  var queFrom = initQueue[int]()
  que.enqueue(0)
  queFrom.enqueue(-1)
  while que.len > 0:
    # ある頂点に対して処理
    var n = que.dequeue()
    var beforeEdge = queFrom.dequeue()
    # 次の頂点
    var nexts = edges[n]
    # 次の頂点への辺
    var nextEdge = edgenum[n]
    var c = 0
    for idx, nextNode in nexts:
      
      # Nodeに来るために通る辺は1つしかない
      if edgecolor[nextEdge[idx]] != -1:
        # 辺がすでに塗られている場合はスキップ
        continue
      else:
        c+=1
        que.enqueue(nextNode)
        queFrom.enqueue(nextEdge[idx])
        if beforeEdge == -1:
          edgecolor[nextEdge[idx]] = ((0 + c) mod usecolor)
        else:
          edgecolor[nextEdge[idx]] = ((edgecolor[beforeEdge] + c) mod usecolor)
  edgecolor.applyIt(it + 1)
  echo usecolor
  for c in edgecolor:
    echo c
        # 新しい辺を、ここに来るのに通った辺の色に+idx mod K + 1する
        # 




  

    




var n = read()

solve(n)