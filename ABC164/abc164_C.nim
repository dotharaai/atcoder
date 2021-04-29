import strutils, algorithm, sequtils, math, sets



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc solve(n:int):int=
  var t= initHashSet[string]()
  for i in 0..<n:
    t.incl(stdin.readLine)
  return t.len

  



var
  n = read()
echo solve(n)