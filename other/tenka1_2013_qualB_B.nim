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



proc solve()=
  var
    (q,L)=(scan(),scan())
    mq = initDeque[int]()
    nq = initDeque[int]()
    count=0
  for i in 0..<q:
    var
      order = read()
      n, m:int
    if order == "Push":
      (n,m) = (scan(), scan())
      if count+n>L:
        echo "FULL"
        return
      else:
        count+=n
      if mq.len>0 and mq.peekFirst == m:
        var temp = nq.popFirst
        nq.addFirst(temp+n)
      else:
        mq.addFirst(m)
        nq.addFirst(n)
    elif order == "Pop":
      n = scan()
      if count-n < 0:
        echo "EMPTY"
        return
      else:
        count-=n
      var
        popped = 0
        lastn = 0
        lastm = 0
      while popped < n:
        lastn=nq.popFirst
        lastm=mq.popFirst
        popped+=lastn
      if popped>n:
        nq.addFirst(popped-n)
        mq.addFirst(lastm)
    elif order == "Top":
      if count==0:
        echo "EMPTY"
        return
      else:
        echo mq.peekFirst
    elif order == "Size":
      echo count
    else:
      echo "Wrong Input"
    #echo nq
    #echo mq
  echo "SAFE"
      
    
  
  
  return
  
    

    
  
solve()