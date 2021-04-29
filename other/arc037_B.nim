import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')


type Status = enum
  INITIAL
  ACTIVE
  DONE



var
    (n,m) = (scan(),scan())
    edges = newseqwith(n,newseq[int](0))    
    root = newseq[int](n)
    status:seq[Status]
    #fp = newseqwith(n,false)



proc isCyclicDFS(node:int,before:int):bool=
  if status[node] == ACTIVE:
    return true
  result=false
  #fp[node] = true
  status[node] = ACTIVE
  for nextnode in edges[node]:
    if before!=nextnode and isCyclicDFS(nextnode,node) == true:
      result = true


proc isCyclic(root:int):bool=
  
  #fp[root] = true
  result = isCyclicDFS(root,root)
  #echo root, ", ", status


proc solve():int=
  for i in 0..<n:
    root[i] = i
  for i in 0..<m:
    var (u,v) = (scan()-1,scan()-1)
    edges[u].add(v)
    edges[v].add(u)
  status = newseqwith(n,INITIAL)
  for i in 0..<n:
    if status[i] == INITIAL and isCyclic(i) == false:
      result+=1




  var q = initDeque[int]()

  return 
  
    

    
  
echo solve()