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
    n = scan()
    a = newseqwith(n,scan()-1)
    app = newseqwith(1E5.int,-1)
    x1=0
    x2=0
  # 初期化
  result=1
  app[a[0]]=0

  while x1<n:
    while x2<n:
      #echo x1,", ",x2
      if x2+1<n:
        if app[a[x2+1]]>=x1:
          x1+=1
        else:
          x2+=1
          app[a[x2]]=x2
        result.max=(x2-x1+1)
      else:
        return



  
    
  
echo solve()