import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')


const D = 1E9.int+7


var mem = initTable[string,int]()
proc nsolve(s:string,caa,cab,cba,cbb:string,n:int):int=
  if mem.haskey(s):
    return mem[s]
  if s.len == n:
    return 1
  else:
    for i  in 0..<s.len-1:
      if s[i..i+1]=="AA":
        result += nsolve(s[0..i] & caa & s[i+1..<s.len],caa,cab,cba,cbb,n)
      elif s[i..i+1]=="AB":
        result += nsolve(s[0..i] & cab & s[i+1..<s.len],caa,cab,cba,cbb,n)
      elif s[i..i+1]=="BA":
        result += nsolve(s[0..i] & cba & s[i+1..<s.len],caa,cab,cba,cbb,n)
      elif s[i..i+1]=="BB":
        result += nsolve(s[0..i] & cbb & s[i+1..<s.len],caa,cab,cba,cbb,n)
  result = result mod D
  mem[s]=result
  return 


proc solve():string=
  var 
    n = 1000
    s = "AB"
    caa = "B"
    cab = "B"
    cba = "B"
    cbb = "B"
  echo nsolve(s,caa,cab,cba,cbb,n)
  

  
  


    
echo solve()