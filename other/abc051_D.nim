import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,m) = (scan(),scan())
    a = newseq[int](m)
    b = newseq[int](m)
    c = newseq[int](m)
    d = newseqwith(n,newseqwith(n,int.high.div(4))) # コスト
    edge = newseqwith(n,newseqwith(n,0))
    next = newseqwith(n,newseqwith(n,int.high.div(4)))

  for i in 0..<n:
    d[i][i] = 0
    for j in 0..<n:
      next[i][j]=j
  
  for i in 0..<m:
    (a[i],b[i],c[i]) = (scan()-1,scan()-1,scan())
    d[a[i]][b[i]]=c[i]
    d[b[i]][a[i]]=c[i]
    edge[a[i]][b[i]] = -1
    edge[b[i]][a[i]] = -1
  for k in 0..<n:
    for i in 0..<n:
      for j in 0..<n:
        if d[i][j] > d[i][k]+d[k][j]:
          d[i][j] = d[i][k]+d[k][j]
          next[i][j] = next[i][k]
  for start in 0..<n:
    
    for goal in 0..<n:
      
      var nxt = start
      while next[nxt][goal] != goal:
        edge[nxt][next[nxt][goal]]+=1
        nxt = next[nxt][goal]
      edge[nxt][goal]+=1
  
  for i in 0..<n:
    for j in 0..<n:
      if edge[i][j] == -1:
        result+=1
  
  result = result.div(2)

  
  
  
    

    
  
echo solve()