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


type Node_t = ref object
  val:int
  ch:seq[Node_t]
  pri:float
  cnt:int
  sum:int


var v = Node_t(val:5, ch : newseq[Node_t](2))


proc count(t:Node_t):int=
  if t == nil:
    return 0
  else:
    return t.cnt

proc sum(t:Node_t):int=
  if t == nil:
    return 0
  else:
    return t.sum


proc update(t:Node_t ):Node_t=
  t.cnt = count(t.ch[0])+count(t.ch[1]) + 1
  t.cnt = sum(t.ch[0])+sum(t.ch[1]) + 1
  return t

proc rotate(t:Node_t, b:int):Node_t=
  var s = t.ch[1-b]
  t.ch[1-b]=s.ch[b]
  s.ch[b]=t
  discard update(t)
  discard update(s)
  return s

proc insert(t:Node_t, k:int,val:int, pri:float):Node_t=
  if t == nil:
    return Node_t(val:val, pri:pri)
  else:
    var
      c:int = count(t.ch[0])
      b:int = int(k > c)
    if b==1:
      t.ch[b] = insert(t.ch[b],k - (c+1),val, pri)
    else:
      t.ch[b] = insert(t.ch[b],k ,val, pri)
    discard update(t)
    if(t.pri > t.ch[b].pri):
      return rotate(t,1-b)

proc erase(t:Node_t)=
  


proc solve():int=
  var
    d = scan()
    dv = 998244353


echo solve()