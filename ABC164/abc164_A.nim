import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

proc solve(s,w:int):string=
  if s <= w:
    return "unsafe"
  else:
    return "safe"
  

var
  s, w = read()

echo solve(s,w)