import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var 
    n = scan()
    c = newseqwith(n,newseqwith(n,scan()))
    possible = true
    a = newseqwith(n,0)
    b = newseqwith(n,0)
  a[0]=c[0][0]
  b[0]=0
  for i in 0..<n-1:
    var
      dif_horizontal = c[0][i+1]-c[0][i]
      dif_vertical = c[i+1][0]-c[i][0]
    b[i+1]=dif_horizontal+b[i]
    a[i+1]=dif_vertical+a[i]

    for j in 1..<n:
      if c[j][i+1]-c[j][i]!=dif_horizontal:
        possible = false
      if c[i+1][j]-c[i][j]!=dif_vertical:
        possible = false
  if not possible:
    echo "No"
    return
  else:
    var
      mina=min(a)
      minb=min(b)
    if mina<0 and minb<0:
      echo "No"
      return
    elif mina<0:
      if abs(mina)<=abs(minb):
        a.applyIt(it+abs(mina))
        b.applyIt(it-abs(mina))
      else:
        echo "No"
        return
    elif minb<0:
      if abs(minb)<=abs(mina):
        a.applyIt(it-abs(minb))
        b.applyIt(it+abs(minb))
      else:
        echo "No"
        return
    echo "Yes"
    echo a.join(" ")
    echo b.join(" ")




  
solve()