import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

proc solve(s:string):string=
  return s[0..2]

var
  s = stdin.readLine

echo solve(s)