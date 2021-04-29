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






proc solve():int=
  var 
    (x,y,a,b)=(scanf(),scanf(),scanf(),scanf())

  proc hantei(target:float):bool=
    var
      p = floor(
        log10(b/((a-1)*x))/log10(a)
      )+1

    
    return log10(x)+p*log10(a)<log10(y-b*(target - p))
    
  proc hanteix(target:float):bool=
    var
      tx = x
      c = 0
    while tx*a<tx+b:
      tx*=a
      c+=1
    tx/=a
    c-=1
    
    return (y-tx)/b>target - c.float

    
    


  
  proc binsearch(left,right:int):int=
    
    if left+1==right:
      return left
    else:
      var mid = (left+right).div(2)
      #echo left,", ",right, ", ", mid
      if hanteix(mid.float):
        return binsearch(mid,right)
      else:
        return binsearch(left,mid)
  return binsearch(0,y.int)


echo solve()