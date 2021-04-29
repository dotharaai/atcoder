import times, strutils, sequtils, math, algorithm, tables, sets, lists, intsets
import critbits, future, strformat, deques
template `max=`(x,y) = x = max(x,y)
template `min=`(x,y) = x = min(x,y)
let read* = iterator: string {.closure.} =
    while true: (for s in stdin.readLine.split: yield s)
proc scan(): int = read().parseInt
proc toInt(c:char): int =
    return int(c) - int('0')

type Type = enum
  DICT
  SET
  INTEGER
  


proc dfs(s:var string,cur:var int):Type{.discardable.}=
  if s[cur] == '{':
    cur+=1
    if s[cur] == '}':
      cur+=1
      return DICT
    else:
      dfs(s,cur)
      if s[cur] == ':':# dict
        cur+=1
        dfs(s,cur) # value
        while s[cur] == ',':
          cur+=1
          dfs(s,cur)
          cur+=1 # ':'に合っている
          dfs(s,cur)
        cur+=1
        return DICT
      else:
        while s[cur] == ',':# set
          cur+=1
          dfs(s,cur)
        cur+=1
        return SET
  else:
    while s[cur]>='0' and s[cur]<='9':
      cur+=1
    return INTEGER
      
    

    


proc solve()=
  var
    s = read()
    cur = 0
  if dfs(s,cur) == DICT:
    echo "dict"
  else:
    echo "set"
  return 
  
    

    
  
solve()