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


proc hsolve(n:string,k:int):int=
  for i in 1..n.parseInt:
    if ($i).len-($i).count('0')==k:
      result+=1






proc nsolve(n:string,k:int):int=
  var
    dpf = newseqwith(n.len+1,newseqwith(k+1,0))
    dpt = newseqwith(n.len+1,newseqwith(k+1,0))
  dpf[0][0]=1
  for idx in 1..n.len:
    dpt[idx][0]=1
  for idx in 1..n.len:
    for used in 1..k:
      if n[idx-1]=='0':
        dpf[idx][used] = dpf[idx-1][used]
      else:
        dpf[idx][used]=dpf[idx-1][used-1]
  for idx in 1..n.len:
    for used in 1..k:
      if n[idx-1]=='0':
        dpt[idx][used] = dpt[idx-1][used-1]*9 + dpt[idx-1][used] 
      else:
        dpt[idx][used] = dpt[idx-1][used-1]*9 + dpt[idx-1][used] + dpf[idx-1][used-1]*(ord(n[idx-1])-ord('0')-1) + dpf[idx-1][used]

  #for dp in dpf:
    #echo dp
  #echo ""
  #for dp in dpt:
    #echo dp
  return dpf[n.len][k]+dpt[n.len][k]

  
  

proc test()=
  for i in 1..<300:  
    for k in 1..3:

      if nsolve($i,k) != hsolve($i,k):
        echo "case:", i, ", ", k
        echo nsolve($i,k), " and ", hsolve($i,k)
    

    
  
#test()
echo nsolve(read(),scan())