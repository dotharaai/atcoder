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

proc getInt():int=
  var t = read()
  result = t.split(".").join().parseInt
  if "." in t:
    var idx = t.find(".")
    result*=10^(9-(t.len-idx-1))
  else:
    result*=10^9
  
proc twoandfive(x:int):(int,int)=
  var x = x
  while x.mod(2)==0:
    result[0]+=1
    x = x.div(2)
  while x.mod(5)==0:
    result[1]+=1
    x = x.div(5)




proc solve():int=
  var
    n = scan()
    b = newseqwith(n,getInt())
    a = b.mapIt(it.twoandfive)
    d = initTable[(int,int),int]()
  #echo a.join("\n")
  for i in 0..<n:
    if d.hasKeyOrPut(a[i],1):
      d[a[i]]+=1
  #echo d
  for (key1,value1) in d.pairs:
    for (key2,value2) in d.pairs:
      if key1[0]+key2[0]>=18 and key1[1]+key2[1]>=18:
        if key1==key2:
          result+=(value1*(value1-1))
        else:
          result+=(value1*(value2))
  result = result div 2

    

  

  
echo solve()