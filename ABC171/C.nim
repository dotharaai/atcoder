import strutils, sequtils, algorithm, math

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


var x = 1000000000000001

proc solve():string=
  var N = stdin.readLine.parseInt
  var answer = newseq[char](0)
  for i in 1..99:
    echo N, ", ", i,", ",26^i
    if N <= 26^i:
      N -= 1
      for j in 0..<i:
        answer.add(chr(
          'a'.int + (N mod 26)
        ))
        N = N div 26
      break
    else:
      N -= 26^i
  return answer.reversed.join("")
  
  
echo solve()