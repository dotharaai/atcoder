import strutils, algorithm, sequtils, random,math,strformat

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


proc calcpow5(n:int):seq[int]=
  for i in 0..n:
    result.add(i^5)

const pow5 = calcpow5(121)

const maxX = 1E9.int
  
proc solve(X:int):string=
  for ai, a in pow5:
    for bi, b in pow5:
      if a+b == X:
        return fmt"{ai} {-bi}"
      elif a - b == X:
        return fmt"{ai} {bi}"
  

  

var
  x = stdin.readLine().parseInt


echo solve(x)
