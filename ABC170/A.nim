import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

proc solve(x:seq[int]):int=
  for i, v in x:
    if v == 0:
      return i+1

var
  x = stdin.readline.split.map(parseInt)

echo solve(x)