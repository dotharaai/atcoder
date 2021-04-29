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
    (n,k)=(scan(),scan())
    p = newseqwith(n,scan()-1)
    c = newseqwith(n,scan())
    len = newseqwith(n,0)
    score = newseqwith(n,0)

  proc search(s:int)=
    var now = p[s]
    var sc = c[now]
    var lgt = 1
    while now != s:
      now = p[now]
      sc += c[now]
      lgt+=1
    len[s]=lgt
    score[s]=sc
    
  for i in 0..<n:
    search(i)
  #echo len
  #echo score
  result =  -int.high.div(4)
  for i in 0..<n:
    if score[i]>0:
      if k.mod(len[i])==0:
        var
          m:int
          sc = 0
          now = i
          t = c[p[now]]
        m = ((k.div(len[i])-1)*score[i])
        for j in 0..<len[i]:
          now = p[now]
          sc+=c[now]
          t.max=sc
        result.max=(m+t)
      else:
        var m = ((k.div(len[i]))*score[i])
        var now = i
        var sc = 0
        var t = c[p[now]]
        for j in 0..<k.mod(len[i]):
          now = p[now]
          sc+=c[now]
          t.max=sc
        result.max=(m+t)
    else:
      var now = i
      var sc = 0
      var t = c[p[now]]
      for j in 0..<min(len[i],k):
        now = p[now]
        sc+=c[now]
        t.max=sc
      result.max=(t)

  
  
echo solve()