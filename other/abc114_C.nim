import algorithm, macros, math, sequtils, strutils, tables
# import bitops, lenientops, deques,
#   heapqueue, sets, sugar


let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

var n:int

proc solveRec(res:var seq[string],v:int)=
  if v > n:
    return
  else:
    res.add($v)
    solveRec(res, v*10+3)
    solveRec(res, v*10+5)
    solveRec(res, v*10+7)
  

proc solve():int=
  n = stdin.readline.parseInt
  var res = newseq[string](0)
  solveRec(res,3)
  solveRec(res,5)
  solveRec(res,7)
  return len(res.filterIt('3' in it and '5' in it and '7' in it))

  


echo solve()