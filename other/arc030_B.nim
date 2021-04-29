import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var
    (n,x)=(scan(),scan()-1)
    h = newseqwith(n,scan())
    f = newseqwith(n,false)
    edges = newseqwith(n,newseq[int]())
  for i in 0..<n-1:
    var (a,b)=(scan()-1,scan()-1)
    edges[a].add(b)
    edges[b].add(a)
  if n==1:
    return 0

  proc searchRec(now:int):int=
    f[now]=true
    # 自分自身が終端なら宝石を持っていれば+2を返す
    if edges[now].filterIt(f[it]!=true).len==0:
      return h[now]*2
    # 自分自身か子が宝石を持っていたら+2して返す
    else:
      result = edges[now].filterIt(f[it]!=true).mapIt(searchRec(it)).sum()
      if (h[now]>0 or result>0) and now!=x:
        result+=2

  return searchRec(x)
  

    
  
echo solve()