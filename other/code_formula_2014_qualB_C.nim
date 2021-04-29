import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
template `mod=`(x,y) = x = x mod y
template scan2 = (scan(), scan())
template scan3 = (scan(), scan())
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc scanf(): float = read().parseFloat
proc toInt(c:char): int =
    return int(c) - int('0')



proc solve():string=
  var
    a = read()
    b = read()
    diff = newseq[int]()
    coa = newseqwith(26,initHashSet[int]())
    cob = newseqwith(26,initHashSet[int]())
    same = false
  for i in 0..<a.len:
    coa[a[i].ord-'a'.ord].incl(i)
    cob[b[i].ord-'a'.ord].incl(i)
  for c in 0..<26:
    if (coa[c] * cob[c]).len>=2:
      same=true

  for i in 0..<a.len:
    if a[i]!=b[i]:
      diff.add(i)
  if diff.len == 0:
    if same:
      return "YES"
    else:
      return "NO"
  elif diff.len == 1:
    return "NO"
  elif diff.len == 2:
    if a[diff[0]]==b[diff[1]] and a[diff[1]] == b[diff[0]]:
      return "YES"
    else:
      return "NO"
  elif diff.len==3:
    var
      ad = newseq[char]()
      bd = newseq[char]()
      
    for i in diff:
      ad.add(a[i])
      bd.add(b[i])
    ad.sort
    bd.sort
    if ad==bd and same:
      return "YES"
    else:
      return "NO"
  elif diff.len==4:
    var
      ad = newseq[char]()
      bd = newseq[char]()
      twoPair = false
      
    for i in diff:
      ad.add(a[i])
      bd.add(b[i])
    if ad.sorted != bd.sorted:
      return "NO"
    for idx1 in 0..<3:
      for idx2 in idx1+1..<4:
        if ad[idx1] == bd[idx2] and ad[idx2]==bd[idx1]:
          twoPair = true
    if twoPair:
      if same:
        return "YES"
      else:
        return "NO"
    else:
      return "YES"
  elif diff.len == 5:
    var
      ad = newseq[char]()
      bd = newseq[char]()
      pair = false
      
    for i in diff:
      ad.add(a[i])
      bd.add(b[i])
    if ad.sorted != bd.sorted:
      return "NO"
    for idx1 in 0..<4:
      for idx2 in idx1+1..<5:
        if ad[idx1] == bd[idx2] and ad[idx2]==bd[idx1]:
          pair = true
    if pair:
      return "YES"
    else:
      return "NO"
  elif diff.len==6:
    var
      ad = newseq[char]()
      bd = newseq[char]()
      pair = 0
      
    for i in diff:
      ad.add(a[i])
      bd.add(b[i])
    if ad.sorted != bd.sorted:
      return "NO"
    for idx1 in 0..<5:
      for idx2 in idx1+1..<6:
        if ad[idx1] == bd[idx2] and ad[idx2]==bd[idx1]:
          pair+=1
    if pair==3:
      return "YES"
    else:
      return "NO"
  else:
    return "NO"





      




    
  
echo solve()