import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc absdist(a,b:(int,int)):int=
  return abs(a[0]-b[0])+abs(a[1]-b[1])


proc solve()=
  var
    (h,w,d)=(scan(),scan(),scan())
    v = newseqwith(h*w,(0,0))
    a = newseqwith(h,newseqwith(w,scan()-1))
    q=scan()
    qs = newseqwith(q,(scan()-1,scan()-1))
    dist = newseqwith(d,newseqwith(((w+1)*(h+1)).div(d)+1,0))

  
  for y in 0..<h:
    for x in 0..<w:
      v[a[y][x]]=(y,x)
  for m in 0..<d:
    var
      k = 1
    while m+k*d<h*w:
      dist[m][k] = dist[m][k-1] + absdist(v[m+k*d],v[m+(k-1)*d])
      k+=1

  for (ql,qr) in qs:
    echo dist[qr.mod(d)][qr.div(d)]-dist[ql.mod(d)][ql.div(d)]


  
  
    

    
  
solve()