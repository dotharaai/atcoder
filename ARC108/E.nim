import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x.mod(y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    (h,w)=(scan(),scan())
    d = 1E9.int+7
    stage =newseqwith(h,read()&"#") & @["#".repeat(w+1)]
    dp = newseqwith(h,newseqwith(w,0))
    cumh = newseqwith(h,newseqwith(w,0))
    cumd = newseqwith(h,newseqwith(w,0))
    cumv = newseqwith(h,newseqwith(w,0))


  dp[0][0]=1
  for x in 1..<w:
    if stage[0][x]=='.' and x==1:
      dp[0][x]=1
    elif stage[0][x]=='.':
      dp[0][x]=dp[0][x-1]*2
      dp[0][x].mod=d
    else:
      dp[0][x]=0
  for y in 1..<h:
    if stage[y][0]=='.' and y==1:
      dp[y][0]=1
    elif stage[y][0]=='.':
      dp[y][0]=dp[y-1][0]*2
      dp[y][0].mod=d
    else:
      dp[y][0]=0
  for x in 0..<w:
    cumh[0][x]=dp[0][x]
    cumd[0][x]=dp[0][x]
    cumv[0][x]=dp[0][x]
  for y in 0..<h:
    cumh[y][0]=dp[y][0]
    cumd[y][0]=dp[y][0]
    cumv[y][0]=dp[y][0]
  proc showthem()=
    echo "cumv"
    for cum in cumv:
      echo cum
    echo "cumh"
    for cum in cumh:
      echo cum
    echo "cumd"
    for cum in cumd:
      echo cum
    echo "stage"
    for st in stage:
      echo st
    echo "dp"
    for ds in dp:
      echo ds
  #showthem()
  for y in 1..<h:
    for x in 1..<w:
      if stage[y][x]=='#':
        dp[y][x]=0
        cumh[y][x]=0
        cumv[y][x]=0
        cumd[y][x]=0
      else:
        # 足し合わせ
        dp[y][x]=(cumh[y][x-1]+cumv[y-1][x]+cumd[y-1][x-1])
        dp[y][x].mod=(d)
        # cumsの更新
        cumh[y][x]=cumh[y][x-1]+dp[y][x]
        cumv[y][x]=cumv[y-1][x]+dp[y][x]
        cumd[y][x]=cumd[y-1][x-1]+dp[y][x]
  #showthem()  
  return dp[h-1][w-1]






  
    




  
    
  

echo solve()
#echo solveworst()