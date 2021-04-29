import algorithm, sequtils, strutils, math,tables,  macros, heapqueue

  


let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s

proc read:int = get().parseInt

const inv = int.high div 2
const en = 2E5.int

proc solve(n,q:int)=
  var yen = newseqwith(en, initHeapQueue[int]())
  var youji = newseqwith(n,0) # 各幼児のrating
  var fairness = initHeapQueue[int]()
  var youji_Yen = newseqwith(n,0) # 各幼児の居る幼稚園
  for i in 0..<n:
    var ab = stdin.readline.split.map(parseInt)
    yen[ab[1]-1].push(inv-ab[0]) #幼稚園ごとに幼児をpush。高い順にpopするためにinv-ratingとする
    youji[i] = ab[0] # 幼児とレートを紐づけ
    youji_Yen[i] = ab[1]-1
  # 初期状態のfairnessを決定
  for i in 0..<en:
    if yen[i].len > 0:
      fairness.push(inv - yen[i][0])
  for y in yen:
    echo y
  echo "fairness: ", fairness
  for qnum in 0..<q:
    var cd = stdin.readline.split.map(parseInt)
    var qyen = youji_Yen[cd[0]-1] #幼児が居た園
    var qrating = youji[cd[0-1]] # 幼児のrating
    # もし幼児が去ることでrating最高値が変わるなら
    if yen[qyen][0] == inv-qrating:
      discard yen[qyen].pop() #最高値の持ち主を削除
      


    # 幼児を転園
    youji_Yen[cd[0]-1] = cd[1]-1
    # 幼児がその幼稚園の最高Rの持ち主なら
    


  
  





var
  n,q = read()
  
solve(n,q)