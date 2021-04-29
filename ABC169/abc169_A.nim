import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

proc solve(a,b:int):int=
  return a*b

var
  a,b = read()

echo solve(a,b)