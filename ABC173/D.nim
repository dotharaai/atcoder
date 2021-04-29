import strutils, algorithm, sequtils, tables

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

  

# 小さい方と等しい心地よさ

# 多分大きい順にソートして入れていき
proc solve()=


solve()