import algorithm, sequtils, strutils, math,tables, queues
let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 
proc read:int = get().parseInt

const D = 1E9.int+7
proc solve(n:int):int=
  var dp = initTable[string,seq[int]]()
  if n == 1:
    return 4
  elif n == 2:
    return 16
  elif n == 3:
    return 61
  dp[""] = newseq[int](n+1)
  for c in "ACGT":
    dp[$c] = newseq[int](n+1)
    dp[$c][1] = 1
    for c2 in "ACGT":
      dp[$c & $c2] = newseq[int](n+1)
      dp[$c & $c2][2] = 1
      for c3 in "ACGT":
        dp[$c & $c2& $c3] = newseq[int](n+1)
        dp[$c & $c2& $c3][3] = 1

  dp["AGC"][3] = 0
  dp["ACG"][3] = 0
  dp["GAC"][3] = 0
  
  for i in 4..n:
    var c:string
    c = "A"
    # Aを入れて禁忌になるケースはない
    for c1 in "ACGT":
      for c2 in "ACGT":
        for c3 in "ACGT":
          dp[$c2 & $c3 & c][i] += dp[$c1 & $c2 & $c3][i-1] mod D
    c = "C"
    # Cを入れて禁忌になるケース：
    # AG※[C]
    # ※AG[C]
    # ※GA[C]
    # A※G[C]
    for c1 in "ACGT":
      for c2 in "ACGT":
        for c3 in "ACGT":
          if (c1 == 'A' and (c2 == 'G' or c3 == 'G')) or (c2 == 'G' and c3 == 'A') or (c2 == 'A' and c3 == 'G'):
            continue
          else:
            dp[$c2 & $c3 & c][i] += dp[$c1 & $c2 & $c3][i-1] mod D
    c = "G"
    # Gを入れて禁忌になるケース
    # ※AC[G]
    for c1 in "ACGT":
      for c2 in "ACGT":
        for c3 in "ACGT":
          if c2 == 'A' and c3 == 'C':
            continue
          else:
            dp[$c2 & $c3 & c][i] += dp[$c1 & $c2 & $c3][i-1] mod D
    c = "T"
    # Tをいれて禁忌になるケースはない
    for c1 in "ACGT":
      for c2 in "ACGT":
        for c3 in "ACGT":
          dp[$c2 & $c3 & c][i] += dp[$c1 & $c2 & $c3][i-1] mod D

  #for key,item in dp:
    #echo key, ":", item
  result = 0
  for c1 in "ACGT":
      for c2 in "ACGT":
        for c3 in "ACGT":
          result += dp[$c1 & $c2 & $c3][n]
          result = result mod D
  
  


  
  


var n = read()

echo solve(n)