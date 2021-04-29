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



proc solve():string=
  var
    n = scan()
    e = newseqwith(n,newseq[int]())
    level = newseqwith(n,int.high)
    par = newseqwith(n,int.high)
  for i in 0..<n-1:
    var (a,b)=(scan()-1,scan()-1)
    e[a].add(b)
    e[b].add(a)
  
  proc bfs(s,t:int)=
    level[s]=0
    par[s]= -1
    var q = initDeque[int]()
    q.addLast(s)
    while q.len>0:
      var p = q.popFirst
      for next in e[p]:
        if level[next]>level[p]+1:
          level[next]=level[p]+1
          par[next]=p
          q.addLast(next)

  proc backTrack(t,s:int):seq[int]=
    result = newseq[int]()
    var t = t
    while t != -1:
      result.add(t)
      t = par[t]
    result.reverse()

  bfs(0,n-1)
  var b = backTrack(n-1,0)
  #echo level
  #echo par
  #echo b
  var
    fenec = 0
    sunuke = 0
  #echo e
  var (ba,bb) = (b[(b.len-1).div(2)],b[(b.len-1).div(2)+1])
  e[ba].keepItIf(it != bb)
  e[bb].keepItif(it != ba)
  
  proc bfsc(s:int):int=
    var q = initDeque[int]()
    level.fill(int.high)
    level[s]=0
    q.addLast(s)
    while q.len>0:
      var p = q.popFirst()
      for next in e[p]:
        if level[next]>level[p]+1:
          level[next]=level[p]+1
          q.addLast(next)
          result+=1
  fenec+=bfsc(0)
  sunuke+=bfsc(n-1)
  if fenec>sunuke:
    return "Fennec"
  else:
    return "Snuke"




  

    


  
echo solve()