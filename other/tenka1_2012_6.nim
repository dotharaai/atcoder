import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve(s:string)=
  var
    s2 = s.strip(chars = {'_'})
    v = newseq[string]()
    idx1 = 0
    idx2 = 0
    lead = 0
    tail = 0
  if s=="_".repeat(s.len):
    return
  for i in 0..<s.len:
    if s[i] != '_':
      lead = i
      break

  for i in 0..<s.len:
    if s[s.len-1-i] != '_':
      tail = i
      break
  echo "_".repeat(lead) & s2 & "_".repeat(tail)

  while idx1 < s2.len:
    
  
solve("lower_camel_case")
solve("snakeCase")
solve("_snakeCase_")
solve("KLab")
solve("_")
solve("___")
