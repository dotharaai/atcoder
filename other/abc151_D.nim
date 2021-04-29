import algorithm, sequtils, strutils, math,tables, queues



let get = iterator: string{.closure.}=
  for s in stdin.readLine.split:yield s
 

const inf = int.high - 5

proc read:int = get().parseInt


  

proc solve(h,w:int):int=
  var maze:seq[string]
  result = 0
  maze.safeAdd("#".repeat(w+2))
  for i in 0..<h:
    maze.add("#" & stdin.readLine & "#")
  maze.add("#".repeat(w+2))
  for d in 0..h+1:
    for r in 0..w+1:
      if maze[d][r] == '.':
        var footPrint = newseqwith(h+2,newseqwith(w+2,-1))
        footPrint[d][r] = 0
        var q = initQueue[tuple[d:int,r:int]]()
        q.enqueue((d:d,r:r))
        while q.len > 0:
          var (nd, nr) = q.dequeue()
          if maze[nd-1][nr] == '.' and footPrint[nd-1][nr] == -1:
            footPrint[nd-1][nr] = footPrint[nd][nr] + 1
            q.enqueue((nd-1,nr))
          if maze[nd+1][nr] == '.' and footPrint[nd+1][nr] == -1:
            footPrint[nd+1][nr] = footPrint[nd][nr] + 1
            q.enqueue((nd+1,nr))
          if maze[nd][nr-1] == '.' and footPrint[nd][nr-1] == -1:
            footPrint[nd][nr-1] = footPrint[nd][nr] + 1
            q.enqueue((nd,nr-1))
          if maze[nd][nr+1] == '.' and footPrint[nd][nr+1] == -1:
            footPrint[nd][nr+1] = footPrint[nd][nr] + 1
            q.enqueue((nd,nr+1))
        for i in footPrint:
          result = max(result, max(i))






  



var
  h, w = read()
echo solve(h,w)