import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques,heapqueue
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
    first = read()
    last = read()
    N = scan()
    s = newseqwith(N,read())
  s = s.deduplicate()
  proc isLink(s1,s2:var string):bool=
    var d = 0
    for i in 0..<s1.len:
      if s1[i]!=s2[i]:
        d+=1
    return d==1
  if first==last:
    echo 0 
    echo first
    echo first
    return
  else:
    s = s.filterIt(it!=first and it!=last)
    s.add(first)
    s.add(last)
    var
      firstIdx = s.len-2
      lastIdx = s.len-1
      nodes = newseqwith(s.len,newseq[int]())
    for i1 in 0..<s.len-1:
      for i2 in i1+1..<s.len:
        if isLink(s[i1],s[i2]):
          nodes[i1].add(i2)
          nodes[i2].add(i1)
    var
      d = newseqwith(s.len,int.high)
      prev = newseqwith(s.len,-1)
    proc dijkstra(start:int)=
      d[start]=0
      var q = initHeapQueue[(int,int)]()
      q.push((0,start))
      while q.len>0:
        var p = q.pop()
        if d[p[1]]<p[0]:
          continue
        else:
          for next in nodes[p[1]]:
            if d[next]>d[p[1]]+1:
              d[next]=d[p[1]]+1
              prev[next]=p[1]
              q.push((d[next],next))
    dijkstra(firstIdx)
    if d[lastIdx]==int.high:
      echo -1
      return
    var
      np = lastIdx
      track = newseq[string]()
    while np!=firstIdx:
      track.add(s[np])
      np = prev[np]
    echo d[lastIdx]-1
    echo s[firstIdx]
    echo track.reversed.join("\n")


solve()