import strutils, sequtils

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc solve(n:int, a:seq[int]):int=
  const m = 1E18.int
  result = 1
  for i in 0..<n:
    try:
      result*=a[i]
    except OverflowError:
      result = -1
      break
    if result > m:
      result = -1
      break
  return 

  


var
  n = stdin.readLine.parseInt
  a = stdin.readLine.split.map(parseInt)

echo solve(n,a)