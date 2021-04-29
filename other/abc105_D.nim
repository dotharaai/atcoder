import algorithm, macros, math, sequtils, strutils, tables
# import bitops, lenientops, deques,
#   heapqueue, sets, sugar


let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt




proc solve(n,m:int, a:seq[int]):int=
  var cumCandy = newseq[int](n+1)
  var modMemo = initTable[int,int]()
  
  for i in 1..n:
    cumCandy[i] = cumCandy[i-1] + a[i-1]
    if modMemo.hasKeyOrPut(cumCandy[i] mod m,1):
      modMemo[cumCandy[i] mod m]+=1
  #echo cumCandy
  result = 0
  #echo modMemo
  for key,value  in modMemo.pairs:
    if key == 0:
      result += value*(value+1) div 2
    else:
      result += value*(value-1) div 2

var
  nm = stdin.readLine.split.map(parseint)
  a = stdin.readLine.split.map(parseInt)



echo solve(nm[0],nm[1],a)