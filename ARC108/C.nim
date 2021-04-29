import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques, heapqueue
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')




proc solve()=
  var 
    (n,m)=(scan(),scan())
    node = newseqwith(n,0)
    edges = newseqwith(n,newseq[int]())
    labels = newseqwith(n,newseq[int]())
  for i in 0..<m:
    var (u,v,c)=(scan()-1,scan()-1,scan())
    edges[u].add(v)
    edges[v].add(u)
    labels[u].add(c)
    labels[v].add(c)
  var
    start = 0
    que = initDeque[int]()
  que.addLast(start)
  while que.len>0:
    
    var now = que.popFirst()
    #echo "now:", now
    var nexts = edges[now]
    for idx in 0..<nexts.len:

      var next = nexts[idx]
      var label = labels[now][idx]
      #echo "next: ",next
      # 辺を救うには両側を勝手に決めてやる必要があるのかも
      if node[now]==0 and node[next]==0:
        node[now]=label
        node[next] = (label) mod n + 1
        que.addLast(next)
      # まだ到達してない頂点は貪欲に救うことにする
      
      elif node[now]!=0 and node[next]==0:
        # こっち側だけで救えてしまっているので向こうの頂点には勘で無関係な数字を入れる
        if node[now]==label:
          node[next] = (label) mod n + 1
        # こちらの頂点ではすくえていないので向こうの頂点で救う
        else:
          node[next]=label
        que.addlast(next)
      # それ以外のケースはnode[next]に別の辺を通って到達している
      # 辺も消失してよい
      #echo node
  for v in node:
    echo v
      

    


  


  

    
  

  

solve()