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



proc solve()=
  var
    (n,m) = (scan(),scan())
    e = newseqwith(n,newseq[int]())
    enable = newseqwith(n,newseq[bool]())
    ine = newseqwith(n,0)
    lv = newseqwith(n,-1)
    parent = newseqwith(n,-1)

  for i in 0..<n+m-1:
    var (a,b)=(scan()-1,scan()-1)
    e[a].add(b)
    ine[b]+=1


  var q = initDeque[int]()
  var s = 0

  # 根を探す
  for i in 0..<n:
    if ine[i]==0:
      s = i
  
  q.addFirst(s)
  lv[s]=0
  parent[s]=0
  

  while q.len>0:
    #echo q
    #echo ine
    var p = q.popFirst()
    for nxt in e[p]:
      ine[nxt]-=1
      if lv[nxt]<lv[p]+1:
        lv[nxt]=lv[p]+1
        parent[nxt]=p+1
      if ine[nxt]==0:
        q.addLast(nxt)
  echo parent.join("\n")



    
solve()