import strutils, algorithm, sequtils, tables

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

  
proc solve()=
  var n = stdin.readLine.parseInt
  var a = stdin.readLine.split.map(parseInt)
  var t = initTable[int,int]()
  var result = 0
  for ai in a:
    if t.hasKeyOrPut(ai, 1):
      t[ai]+=1
  var q = stdin.readLine.parseInt
  for (k, v) in t.pairs():
    result+=k*v
  for i in 0..<q:
    var bc = stdin.readLine.split.map(parseInt)
    if t.hasKey(bc[0]):
      if t.hasKeyOrPut(bc[1], t[bc[0]]):
        t[bc[1]]+=t[bc[0]]
      result += t[bc[0]]*bc[1] - t[bc[0]]*bc[0]
      echo result
      t.del(bc[0])
    else:
      echo result
      


  


solve()