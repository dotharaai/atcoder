

import strutils,algorithm, sequtils, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc solve(n:string,k:int):int=
  if k==1:
    result=($n[0]).parseInt+9*(n.len-1)
  elif k==2:
    result = ($n[1]).parseInt

  return

var
  n = stdin.readLine
  k = read()


assert(solve("340")==339,"sample 1")
assert(solve("54321")==54320,"sample 2")
