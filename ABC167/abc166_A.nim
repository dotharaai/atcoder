import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

proc solve(s:string):string=
  if s == "ABC":
    return "ARC"
  return "ABC"

var
  s = stdin.readLine()

echo solve(s)