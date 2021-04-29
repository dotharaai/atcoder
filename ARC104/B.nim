import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():int=
  var 
    (n, s) = (scan(), read())
    cA = newseqwith(n+1,0)
    cT = newseqwith(n+1,0)
    cG = newseqwith(n+1,0)
    cC = newseqwith(n+1,0)
  # 尺取り法
  # 相補的：
  # A-T
  # C-G
  # より
  # Aの個数とTの個数が等しい and Cの個数とTの個数が等しいとき相補的なやつがある

  for i in 0..<n:
    cA[i+1]=cA[i]
    cT[i+1]=cT[i]
    cG[i+1]=cG[i]
    cC[i+1]=cC[i]
    if s[i]=='A':
      cA[i+1]+=1
    elif s[i]=='T':
      cT[i+1]+=1
    elif s[i]=='G':
      cG[i+1]+=1
    elif s[i]=='C':
      cC[i+1]+=1
  #echo cA
  #echo cT
  #echo cG
  #echo cC
  for left in 1..n-1:
    for right in left+1..n:
      if cA[right]-cA[left-1]==cT[right]-cT[left-1] and cG[right]-cG[left-1]==cC[right]-cC[left-1]:
        result+=1

  

echo solve()