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



proc enumDivisors(n:int):seq[int]=
  var i = 1
  while i^2 <= n:
    if n.mod(i)==0:
      result.add(i)
      if i^2!=n:
        result.add(n.div(i))
    i+=1
  result.sort(SortOrder.Ascending)

proc solve():int=
  var
    n = scan()
    ds = enumDivisors(n)
    ks = enumDivisors(n-1)
    cases = initHashSet[(int,int,int)]()
  for d in ds:
    if d==1 or d==n:
      continue
    var
      b = 1
      tn = n
    while tn.mod(d)==0:
      if (tn.div(d)-1).mod(d)==0:
        cases.incl(((tn.div(d)-1).div(d),d,b))
      tn = tn.div(d)
      b+=1
  #echo cases
  return cases.len + ks.len
    



  


  

  
echo solve()