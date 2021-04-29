import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')






# modPow
# 無いので作る
# なんか畳み込んで上手いことやるやつ
proc modPow(x,b,m:int):int=
  if b == 1:
    return x
  return (modPow((x^2) mod m, b div 2, m) * x^(b mod 2)) mod m

proc hmodPow*(n, p, m: int): int =
  var (n, p) = (n, p)
  result = 1
  while p != 0:
    if (p and 1) == 1: result = result * n mod m
    n = n * n mod m
    p = p shr 1


const D = 1E9.int+7
const m = 2000^2

proc calcModpow():seq[int]=
  result = newseq[int](m+1)
  for i in 1..m:
    result[i]=hmodPow(2,i,D)

#const modpows:seq[int]=calcModpow()

proc solve():int=
  var
    (h,w) = (scan(),scan())
    s = newseqwith(h,read()&"#") & @["#".repeat(w+1)]
    #(h,w)=(2000,2000)
    #s = newseqwith(h,".".repeat(w)&"#") & @["#".repeat(w+1)]
  var
    k = s.mapIt(it.count('.')).sum()
    p = newseqwith(h,newseqwith(w,newseq[int](2)))
  for y in 0..<h:
    for x in 0..<w:
      if s[y][x]=='.':
        # ある横に伸びるマスがそれより左のマスから始まっている場合は左のマスで数えたものを利用
        if (x>0 and s[y][x-1]=='.'):
          p[y][x][0]=p[y][x-1][0]
        else:
          var length = 0
          while s[y][x+length]=='.':
            length+=1
          p[y][x][0]=length
        # ある縦に伸びるマスがそれより上のマスから始まっている場合は上のマスで数えたものを利用
        if (y>0 and s[y-1][x]=='.'):
          p[y][x][1]=p[y-1][x][1]
        else:
          var length = 0
          while s[y+length][x]=='.':
            length+=1
          p[y][x][1]=length
  var pw = newseq[int](k+1)
  pw[0]=1
  for i in 1..k:
    pw[i]= pw[i-1]*2 mod D


  result = 0
  for y in 0..<h:
    for x in 0..<w:
      if s[y][x]=='.':
        var tp = p[y][x].sum()-1

        #result += table[k-tp]*(table[tp]-1)
        #result += table[k]-table[k-tp] + D
        result += D +  pw[k] - pw[k-tp]
        #result += modPows[k-(p[y][x].sum()-1)]*(modPows[p[y][x].sum()-1]-1)
  result = result.mod(D)




  




echo solve()