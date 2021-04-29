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



proc check(s:string):bool=
  var s = s.toSeq.sorted.join()
  if s.parseInt.mod(8)==0:
    return true
  while s.nextPermutation:
    if s.parseInt.mod(8)==0:
      return true
  return false


proc solve():bool=
  var 
    s = read()
    h = 0
    c = newseqwith(10,0)
  for ch in s:
    c[ch.toInt]+=1

  
  
  if s.len<=5:
    return check(s)
  result = false 
  while h<1000:
    var
      st = fmt"{h}"
      ch = true

    if st.count("0")>0 or st.len!=3:
      h+=8
      continue  

    for i in 1..9:
      # 使っていて、sが持っている文字数より多い場合：NG
      if st.count($i)>0 and st.count($i)>c[i]:
        ch = false
        break
    if ch:
      result=true
      break
    h+=8
    


    
    

if solve():
  echo "Yes"
else:
  echo "No"