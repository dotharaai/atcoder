import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve()=
  var
    n = scan()
    c = newseqwith(n-1,0)
    s = newseqwith(n-1,0)
    f = newseqwith(n-1,0)
  for i in 0..<n-1:
    (c[i],s[i],f[i]) = (scan(),scan(),scan())
  for i in 0..<n-1:
    var t = 0
    for j in i..<n-1:
      var n = 0
      n = (t-s[j]).div(f[j])
      if (t-s[j]).mod(f[j])>0:
        n+=1
      n.max=0
      #while s[j]+n*f[j]<t:
        #n+=1
      t=s[j]+n*f[j]+c[j]
    echo t
        



    

    
  
solve()