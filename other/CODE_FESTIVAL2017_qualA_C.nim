import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    (h,w)=(scan(),scan())
    a = newseqwith(h,read())
    cc = initTable[char,int]()
    ccl = newseq[int](0)
  for line in a:
    for c in line:
      if cc.hasKeyOrPut(c,1):
        cc[c]+=1
  for k,v in cc.pairs:
    ccl.add(v)
  # hとwがどちらも奇数の場合
  # 中心に奇数が１つあり、2個が(h-1)*2+(w-1)*2個,(h-1)*(w-1)個の4
  if h.mod(2) == 1 and w.mod(2) == 1:
    for i in 0..<1:
      for idx, v in ccl:
        if v.mod(2)==1:
          ccl[idx]-=1
          break
    if ccl.mapIt(it.div(4)).sum()>=((h-1)*(w-1)).div(4):
      for i in 0..<((h-1)*(w-1)).div(4):
        for idx, v in ccl:
          if v>=4:
            ccl[idx]-=4
            break
    else:
      return "No"
    if ccl.mapIt(it.div(2)).sum==((h-1)+(w-1)).div(2):
      return "Yes"
    else:
      return "No"
      

  # hのみが奇数の場合
  # 2の倍数がw個, 4の倍数が(h-1)*w個

  if h.mod(2) == 1 and w.mod(2) == 0:
    if ccl.mapIt(it.div(4)).sum()>=((h-1)*w).div(4):
      for i in 0..<((h-1)*w).div(4):
        for idx, v in ccl:
          if v>=4:
            ccl[idx]-=4
            break
    else:
      return "No"
    if ccl.mapIt(it.div(2)).sum==w.div(2):
      return "Yes"
    else:
      return "No"
  # wのみが奇数の場合
  # 2の倍数がh, 4の倍数が(w-1)*h個
  if h.mod(2) == 0 and w.mod(2) == 1:
    if ccl.mapIt(it.div(4)).sum()>=((w-1)*h).div(4):
      for i in 0..<((w-1)*h).div(4):
        for idx, v in ccl:
          if v>=4:
            ccl[idx]-=4
            break
    else:
      return "No"
    if ccl.mapIt(it.div(2)).sum==h.div(2):
      return "Yes"
    else:
      return "No"

  # どちらも偶数の場合
  # 4の倍数がh*w個
  if h.mod(2) == 0 and w.mod(2) == 0:
    if ccl.mapIt(it.div(4)).sum()==(h*w).div(4):
      return "Yes"
    else:
      return "No"
  
    

    
  
echo solve()