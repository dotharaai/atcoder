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
    (n, m) = (scan(),scan())
    w = newseqwith(n,scan())
    leng = newseq[int](m)
    val = newseq[int](m)
  for i in 0..<m:
    (leng[i],val[i])=(scan(),scan())

  # 最大値と最小値が判っているから二分探索は？
  # O(log(1E13))<44
  # ※整数しか考えなくて良い
  # 隊列の最大長が判っているときの判定は……
  # N!<=40320パターンについて可能か不可能か調べればいい
  # 条件式は1E5個
  # どこかにクリティカルになる橋があるのかな
  #
  # 逆にN!パターンに対して最短長をO(√M)以下とかで求める方法がある説
  # 
  # まとめられる範囲でまとめる？
  # 最小荷重を超えるまでまとめる



  

    
  

  

echo solve()