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



proc solve():int=
  var
    n = scan()
    a = newseqwith(n,scan())
    cont = newseqwith(n,0)
  cont[0]=1
  for i in 1..<n:
    if a[i]==a[i-1]:
      cont[i]=cont[i-1]+1
    else:
      cont[i]=1
  if cont.max==n:
    return -1
  else:
    var tmax = cont.max
    if a[0]==a[n-1]:
      var zero=0
      while cont[zero]<cont[zero+1]:
        zero+=1
      tmax.max=cont[zero]+cont[n-1]
    #echo cont
    #echo tmax
    return (tmax-1).div(2)+1

    



  
    

    
  
echo solve()