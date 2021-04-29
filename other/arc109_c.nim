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
    (n,k)=(scan(),scan())
    s = read()
    memo = newseqwith(101,newseqwith(101,'Z'))
    bekis = newseqwith(100+1,0)
  #s = s.repeat(2)
  bekis[0]=1
  for i in 1..100:
    bekis[i]=(bekis[i-1]*2)mod(n)
  proc rec(edge:int,k:int):char=
    var edge = edge.mod(n)
    #echo fmt"({edge}, {k})"
    if k==0:
      return s[edge]
    if memo[edge][k]!='Z':
      return memo[edge][k]
    else:
      var
        lv = rec(edge,k-1)
        rv = rec(edge+bekis[k-1],k-1)
      if lv=='R':
        if rv=='R' or rv=='S':
          memo[edge][k]='R'
          return 'R'
        else:
          memo[edge][k]='P'
          return 'P'
      if lv=='S':
        if rv=='S' or rv=='P':
          memo[edge][k]='S'
          return 'S'
        else:
          memo[edge][k]='R'
          return 'R'
      if lv=='P':
        if rv=='P' or rv=='R':
          memo[edge][k]='P'
          return 'P'
        else:
          memo[edge][k]='S'
          return 'S'
  echo rec(0,k)



    

    
  
solve()