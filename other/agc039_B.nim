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
    n =  scan()
    conn  = newseqwith(n,read())
    lev = newseqwith(n,int.high)
  
  proc bfs(s:int):bool=
    lev.fill(int.high)
    lev[s]=0

    var q = initDeque[int]()
    q.addLast(s)
    while q.len>0:
      var p = q.popFirst()
      for nxt in 0..<n:
        if conn[p][nxt]=='1':
          if lev[nxt]==int.high:
            lev[nxt].min=lev[p]+1
            q.addLast(nxt)
          elif lev[nxt]!=lev[p]-1 and lev[nxt] != lev[p]+1:
            return false
    return true
  var t = false
  for i in 0..<n:
    var v = bfs(i)
    t = t or v
    if v:
      result.max=lev.max()+1
  if t:
    return result
  else:
    return -1
          




    

    
  
echo solve()