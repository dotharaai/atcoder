import strutils,algorithm, sequtils, math, tables

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc solve(n:int)=
  var a = stdin.readLine.split.map(parseInt)
  var t = initTable[int,int]()
  var tn = initTable[int,int]()
  for i in a:
    if t.hasKeyOrPut(i, 1):
      t[i]+=1
  var tsum = 0
  for k,v in t:
    tn[k] = v*(v-1) div 2
    tsum+=tn[k]

  for idx, ai in a:
    echo tsum - t[ai] + 1


  
  




var n = stdin.readLine.parseInt
solve(n)