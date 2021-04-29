import sequtils, tables, math, macros, strutils




macro toTuple*(rhs: seq,cnt: static[int]): auto =
  let t = genSym(); result = quote do:(let `t` = `rhs`;())
  for i in 0..<cnt: result[0][1].add(quote do:`t`[`i`])

# combination
# コンビネーションの計算



proc solver(a,b:int):int=
  if a == b:
    return 2*a - 2
  elif a + 1  == b:
    return 2*a - 2
  else:
    
    return

proc solve()=
  var q = stdin.readline.parseint
  for i in 0..<q:
    var (a, b) = stdin.readline.split.map(parseint).toTuple(2)
    echo solver(min(a,b), max(a,b))


solve()