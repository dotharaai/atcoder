import strutils, algorithm, sequtils


let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt


# 1. あるエージェントが他のエージェントと手を組めるポイントは高々2点しかないのでその二か所に自分のインデックスを追加する
# 2. そのリストで


proc solve(n:int):int=
  var 
    sankashas = stdin.readLine.split.mapIt(it.parseInt)
    pairablePoints_height = newseqwith(n, newseq[int](0))
    pairablePoints_index = newseqwith(n, newseq[int](0))
  

  # 自分の位置から自分の身長分離れたところに自分のインデックスを追加
  #echo sankashas
  for idx, sankasha in sankashas:
    var
      left = idx-sankasha
      right = idx+sankasha
    if left >= 0:
      pairablePoints_height[left].add(sankasha)
      pairablePoints_index[left].add(idx)
    if right < n:
      pairablePoints_height[right].add(sankasha)
      pairablePoints_index[right].add(idx)
    
  #echo pairablePoints_height
  #echo pairablePoints_index
  for (idx,height) in zip(pairablePoints_index,pairablePoints_height):
    for idx_left in 0 ..< height.len:
      for idx_right in (idx_left+1)..<height.len:
        if height[idx_left]+height[idx_right] == abs(idx[idx_left]-idx[idx_right]):
          
          result+=1
  return



#


var
  n = read()

echo solve(n)