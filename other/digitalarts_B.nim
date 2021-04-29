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



proc solve():string=
  var
    a = read()
  if a == "a" or a == "z".repeat(20):
    return "NO"
  else:
    if a.allIt(it=='a'):
      return a[0..<a.len-2] & "b"
    elif a.allIt(it=='z'):
      return a[0..<a.len-1] & "mm"
    elif a.len==1:
      var
        t = (a[0].ord-'a'.ord+1)
        t1:int
        t2:int
      if t.mod(2)==0:
        t1 = t.div(2)+'a'.ord-1
        t2 = t.div(2)+'a'.ord-1
      else:
        t1 = t.div(2)+'a'.ord-1
        t2 = t.div(2)+1+'a'.ord-1
      return t1.chr&t2.chr

    else:
      for i in 0..<a.len:
        for j in 0..<a.len:
          if  i!=j and a[i]>'a' and a[j]<'z':
            a[i]=(a[i].ord-1).chr
            a[j]=(a[j].ord+1).chr
            return a


  
    

    
  
echo solve()