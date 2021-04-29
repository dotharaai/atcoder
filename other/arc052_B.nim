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



proc solve()=
  var
    (n, q) = (scan(),scan())
    x = newseq[float](n)
    r = newseq[float](n)
    h = newseq[float](n)
    a = newseq[float](q)
    b = newseq[float](q)
    
  for i in 0..<n:
    (x[i], r[i], h[i]) = (scanf(),scanf(),scanf())
  for i in 0..<q:
    (a[i],b[i]) = (scanf(),scanf())

  for j in 0..<q:
    var res:float=0
    var
      av = a[j]
      bv = b[j]
    for i in 0..<n:
      if bv <= x[i] or x[i]+h[i]<=av:
        discard
      elif av <= x[i] and x[i]+h[i] <= bv:
        res+=PI*(r[i]^2)*h[i]/3
      elif av < x[i] and bv <= x[i]+h[i]:
        res+=PI*(r[i]^2)*h[i]/3-(PI*(r[i]^2)*h[i]/3)*(x[i]+h[i]-bv)^3/h[i]^3
      elif x[i]<=av and x[i]+h[i]<=bv:
        res+=(PI*(r[i]^2)*h[i]/3)*(x[i]+h[i]-av)^3/h[i]^3
      elif x[i]<=av and bv <= x[i]+h[i]:
        res += (PI*(r[i]^2)*h[i]/3)*(x[i]+h[i]-av)^3/h[i]^3 - (PI*(r[i]^2)*h[i]/3)*(x[i]+h[i]-bv)^3/h[i]^3
    echo res
      


    

    
  
solve()