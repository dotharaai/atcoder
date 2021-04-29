import algorithm, sequtils, strutils, math,tables,  macros, heapqueue


const D = 1E9.int+7



proc solve():int=
  var
    f = open("ABC173/hand_02.txt", FileMode.fmread)
    nk = f.readline().split.map(parseInt)
    (n,k) = (nk[0],nk[1])
    a = f.readline.split.map(parseInt)
    positive = newseq[int](0)
    negative = newseq[int](0)
    zeros = 0
  f.close()
  #var
    #nk = stdin.readline.split.map(parseInt)
    #(n,k) = (nk[0],nk[1])
    #a = stdin.readline.split.map(parseInt)
    #positive = newseq[int](0)
    #negative = newseq[int](0)
    #zeros = 0
  # 正の値と負の値で分割してソート
  # 全ての瞬間で、負の値は2個いっぺんに取るしかない(正の値にしたいので)
  # 全ての瞬間で、正の値の先頭二つと負の値の先頭二つの積を比較して、大きい方を選択
  # 残り奇数個の場合は正の方を採用する
  # 正の値になりえないケース
  # (0) ゼロになる
  
  # (1) 負の値になる
  # 負の値からどうしても奇数個選択しなければならない場合
  # 正の値が一つでもあればそれを選択することで正負をひっくり返せるので、正の値がない場合のみ
  # 負の値を小さい方から選択していく
  # (2) ゼロになる
  for av in a:
    if av>0:
      positive.add(av)
    elif av < 0:
      negative.add(av)
    else:
      zeros+=1
  # 正の値が作れる条件
  # negativeから0,2,4,6...個取って作れる
  # kが奇数のときはpositiveが1つ以上必要
  if (k mod 2 == 0 and k - (negative.len div 2) * 2 <= positive.len) or (k mod 2 == 1 and positive.len>0 and k  - (negative.len div 2) * 2 <= positive.len):
  #if positive.len+negative.len>k or (k mod 2 == 0 and positive.len+negative.len==k and negative.len mod 2 == 0):
    result=1
    # 後ろの値ほど絶対値大
    positive.sort(SortOrder.Ascending)
    negative.sort(SortOrder.Descending)
    var used = 0
    while used < k:
      if k - used >= 2 and (positive.len >= 2 or negative.len>=2):
        used+=2
        # 2個以上ピックしてよくて、できる
        if positive.len >= 2 and negative.len>=2:
          var pside = positive[positive.len-1]*positive[positive.len-2]
          var nside = negative[negative.len-1]*negative[negative.len-2]
          # 正側の方が大きい
          if pside >= nside:
            result*=(pside mod D)
            result = result mod D
            discard positive.pop()
            discard positive.pop()
          else:
            result*=(nside mod D)
            result = result mod D
            discard negative.pop()
            discard negative.pop()
        elif positive.len>=2:
          var pside = positive[positive.len-1]*positive[positive.len-2]
          result*=(pside mod D)
          result = result mod D
          discard positive.pop()
          discard positive.pop()
        elif negative.len>=2:
          var nside = negative[negative.len-1]*negative[negative.len-2]
          result*=(nside mod D)
          result = result mod D
          discard negative.pop()
          discard negative.pop()
      else:
        # 二個以上ピックしてはいけないか、できない
        # 負側からはもうとってはいけない
        used+=1
        result*=positive.pop()
        result = result mod D
    
    
  # 正の値は作れないが、ゼロが作れる
  elif zeros>0:
    result = 0
  # 正の値もゼロも作れないので、負のできるだけ絶対値が小さい値を作る
  # positive,negativeから絶対値が小さい順に取っていく
  else:
    result=1
    positive.sort(SortOrder.Descending) # 後ろほど小さい
    negative.sort(SortOrder.Ascending) # 後ろほど絶対値小さい
    for i in 0..<k:
      if positive.len>0 and negative.len>0:
        if positive[positive.len-1] < abs(negative[negative.len-1]):
          result*=positive[positive.len-1] mod D
          discard positive.pop() 
        else:
          result *= -negative[negative.len-1] mod D
          discard negative.pop()
      elif positive.len > 0:
        result*=positive[positive.len-1] mod D
        discard positive.pop() 
      else:
        result *= -negative[negative.len-1] mod D
        discard negative.pop()
      result = result mod D
    result *= -1
    result+=D
    result = result mod D

          









  




#prepare()
#echo -15 mod D
echo solve()