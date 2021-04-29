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
    a = newseqwith(n,scan())
    bits = newseqwith(20+1,newseqwith(n,false))
    cbits = newseqwith(20+1,newseqwith(n+1,0))
  for k in 0..20:
    for i in 0..<n:
      bits[k][i] = ((2^k and a[i] ) > 0)
      cbits[k][i+1] = cbits[k][i] + int((2^k and a[i] ) > 0)
  #for b in bits:
    #echo b
  #echo ""
  #for b in cbits:
    #echo b

  var y = 0
  for x  in 0..<n:
    y.max=x+1
    while y<=n and cbits.allIt(it[y]-it[x]<=1):
      y+=1
    y-=1
    result+=y-x


  
    

    
  
echo solve()