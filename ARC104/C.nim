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
    n = scan()
    a = newseqwith(n,0)
    b = newseqwith(n,0)
    c = newseqwith(n,0)
    cfloor = newseqwith(2*n,-1)
    u = newseqwith(n,false)
    iswronginput = false
  for i in 0..<n:
    (a[i],b[i])=(scan(),scan())
    # 両方とも入力されている
    if a[i]>0 and b[i]>0:
      c[i]=b[i]-a[i]-1
      if c[i]<0 or c[i]>=n:
        iswronginput=true
      else:
        for idx in a[i]-1..b[i]-1:
          if cfloor[idx] == -1:
            cfloor[idx]=c[i]
          elif cfloor[idx]!=c[i]:
            iswronginput=true
    else:
      c[i] = -1
  echo cfloor
  if iswronginput:
    return "No"

  for i in 1..2*n:
    if a.count(i)>=2 or b.count(i)>=2:
      return "No"
  var left=0
  
  while left<2*n:
    var run = 0
    if cfloor[left] == -1:
      while cfloor[left+run] == -1:
        run+=1
      
    






    

  # なんか始点が明らかなやつからソートしてく感じなんでしょ？
  # それぞれの階で乗り降りした人はただ一人
  # つまり……？
  # 

  

  

    
  

  

echo solve()