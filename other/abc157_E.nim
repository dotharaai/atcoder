import strutils,algorithm, sequtils, math, sets

let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt



var seg:seq[seq[char]]
var baselen:int


proc echoTable()=
  var t = 1
  echo "0 : ",seg[0]
  while t<baselen:
    t*=2
    echo t-1, " ~ " , 2*t-2 ," : ",seg[t-1..(2*t-2)]


proc fetch(reqa:int,reqb:int,k:int = 0,left:int = 0,right:int = baselen-1):seq[char]=
  var
    right = right
    left = left
  #echo reqa, ", ", reqb, ", ", k, ", ", left, ", " , right
  if (right < reqa or reqb < left): return newseq[char](0)
  if (reqa <= left and right <= reqb): return seg[k]
  #echo "  =>"
  var 
    vl = fetch(reqa,reqb,2*k+1,left,(left+right) div 2)
    vr = fetch(reqa,reqb,2*k+2,(left+right) div 2 + 1,right)
  return (vl&vr).deduplicate()

proc update(fidx:int, next:char)=
  var idx = fidx + (baselen-1)
  var prev = seg[idx][0]
  var isleft:bool
  #echo isleft
  seg[idx] = @[next]
  # delete prev
  while idx > 0:
    isleft = (idx mod 2)== 1
    idx = (idx-1) div 2
    if isleft and prev in seg[2*idx+2]:
      break
    elif not isleft and prev in seg[2*idx+1]:
      break
    else:
      seg[idx].delete(seg[idx].find(prev))
  #echo "deleted:"
  #echoTable()

  # append next
  idx = fidx + (baselen-1)
  while idx > 0:
    isleft = (idx mod 2)== 1
    idx = (idx-1) div 2
    if isleft and next in seg[2*idx+2]:
      break
    elif not isleft and next in seg[2*idx+1]:
      break
    else:
      seg[idx].add(next)
  #echo "appended"
  #echoTable()

  return

proc initData(n:int, S:string)=
  var t = 1
  while t < n:
    t*=2
  #echo "string length:", n
  #echo "required 2 beki: " , t
  #echo "hairetu size: ", 2*t-1

  seg = newseqWith(2*t-1,newseq[char]())
  for i in 0..<n:
    seg[i+t-1].safeadd(S[i])
  #echo seg
  for i in countdown(t-2, 0):
    #echo i, " <= ", 2*i+1, " and ", 2*i+2
    #echo seg[2*i+1], " and ", seg[2*i+2]
    seg[i]   = (seg[2*i+1] & seg[2*i+2]).deduplicate()
  baselen = t

proc procquery(q:string)=
  #echo "proc"
  var query = q.split()
  if query[0] == "1":
    #echo "update: ",query[1],", ", query[2][0]
    update(query[1].parseInt-1,query[2][0])
    #echoTable()
  else:
    #echo "search:", query[1].parseInt-1,"~",query[2].parseInt
    echo len(fetch(query[1].parseInt-1,query[2].parseInt-1))




var
  N = read()
  S = stdin.readLine
  Q = stdin.readLine.parseInt
  queries:seq[string] = newseqWith(Q,stdin.readLine)



initData(S.len,S)
#echo S.len
#echoTable()
for q in queries:
#while true:
  #procquery(stdin.readLine)
  procquery(q)
#  echoTable()

