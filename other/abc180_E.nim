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
    x = newseqwith(n-1,0)
    y = newseqwith(n-1,0)
    z = newseqwith(n-1,0)
    inf = int.high.div(4)
    dp = newseqwith(2^(n-1),newseqwith(n-1,inf))
    (sx,sy,sz) = (scan(),scan(),scan())
  for i in 0..<n-1:
    (x[i],y[i],z[i]) = (scan(),scan(),scan())
  for i in 0..<n-1:
    dp[0][i]=0
  for S in 1..<2^(n-1):
    
    var 
      b = S.toBin(n-1)
    #echo S, ": ", b
    if b.count('1')==1:
      for i in 0..<n-1:
        if b[i]=='1':
          dp[S][i] = abs(x[i]-sx) + abs(y[i]-sy) + max(0,z[i]-sz)
    else:
      # newP:新しく追加された頂点
      for newP, v in b:
        if v=='1':
          # newP
          for fromP, val in b:
            if newP != fromP and val == '1':
              #echo S, ", ", 2^(n-2-newP)
              dp[S][newP].min=(dp[S-2^(n-2-newP)][fromP]+abs(x[newP]-x[fromP])+abs(y[newP]-y[fromP])+max(0,z[newP]-z[fromP]))

  result=inf
  for f in 0..<n-1:
    result.min=(dp[2^(n-1)-1][f] + 
      abs(sx-x[f]) + abs(sy-y[f]) + max(0,sz-z[f]))
      
    

    
  

  
    

    
  
echo solve()