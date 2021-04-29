import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

const PI = 3.141592
proc solve(R:float):float=
  return 2*R*PI

var
  R = read()

echo solve(R.float)