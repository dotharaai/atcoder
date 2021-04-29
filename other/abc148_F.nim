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



proc solve():int=
  var
    (n,u,v)=(scan(),scan()-1,scan()-1)
    e = newseqwith(n,newseq[int]())
  for i in 0..<n-1:
    var (a,b)=(scan()-1,scan()-1)
    e[a].add(b)
    e[b].add(a)
  
  proc bfs(s:int):seq[int]=
    result = newseqwith(n,int.high)
    result[s] = 0
    var q = initDeque[int]()
    q.addLast(s)
    while q.len>0:
      var p = q.popLast()
      for nxt in e[p]:
        if result[nxt]>result[p]+1:
          result[nxt]=result[p]+1
          q.addLast(nxt)
  
  var vs = bfs(v)
  var us = bfs(u)
  #echo vs
  #echo us
  for i in 0..<n:
    if vs[i]>us[i]:
      result.max=(vs[i]-1)



echo solve()