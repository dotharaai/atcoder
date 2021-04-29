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
    m = scan()
    a = newseqwith(n,scan())
    nxt = newseqwith(n,newseq[int]())
    memo = newseqwith(n,-int.high)
  result  = -int.high
  for i in 0..<m:
    var (x,y)=(scan()-1,scan()-1)
    nxt[x].add(y)
  
  proc dfs(city:int):int=
    if memo[city] != -int.high:
      return memo[city]
    else:
      if nxt[city].len>0:
        memo[city] = max(a[city],nxt[city].mapIt(dfs(it)).max())
      else:
        memo[city]=a[city]
      return memo[city]

  for city in 0..<n:
    if nxt[city].len>0:
      result.max=(nxt[city].mapIt(dfs(it)).max - a[city])
  


  
    

    
  
echo solve()