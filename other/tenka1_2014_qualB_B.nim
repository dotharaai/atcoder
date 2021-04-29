import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



const D = 1000000007

proc solve():int=
  var
    n = scan()
    s = read()
    words = newseqwith(n,read())
    dp = newseqwith(len(s)+1,0)
  dp[0]=1
  for idx in 1..s.len:
    for word in words:
      if idx-word.len>=0 and s[idx-word.len..<idx]==word:
        
        dp[idx]+=dp[idx-word.len]
        dp[idx].mod=D
  return dp[^1]
  


  

  
  
    

    
  
echo solve()