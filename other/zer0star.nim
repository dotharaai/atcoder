# ========= utils/base.nim ========= {{{

when not declared(INCLUDE_GUARD_UTILS_BASE_NIM):
  const INCLUDE_GUARD_UTILS_BASE_NIM = 1
  import macros
  macro Please(x): untyped = nnkStmtList.newTree()

  Please give me AC
  Please give me AC
  Please give me AC

  {.hints: off, overflowChecks: on.}

  import strutils, sequtils, math, algorithm
  when (not (NimMajor <= 0)) or NimMinor >= 19:
    import sugar
  else:
    import future

  iterator range(x, y: int): int {.inline.} =
    var res = x
    while res < y:
      yield res
      inc(res)
  iterator range(x: int): int {.inline.} =
    var res = 0
    while res < x:
      yield res
      inc(res)
  proc range(x, y: int): seq[int] {.inline.} =
    toSeq(x..y-1)
  proc range(x: int): seq[int] {.inline.} =
    toSeq(0..x-1)
  proc discardableId[T](x: T): T {.inline, discardable.} =
    return x
  macro `:=`(x, y: untyped): untyped =
    if (x.kind == nnkIdent):
      return quote do:
        when declaredInScope(`x`):
          `x` = `y`
        else:
          var `x` = `y`
        discardableId(`x`)
    else:
      return quote do:
        `x` = `y`
        discardableId(`x`)
  when NimMajor <= 0 and NimMinor <= 17:
    proc count[T](co: openArray[T]; obj: T): int =
      for itm in items(co):
        if itm == obj:
          inc result
  proc divmod(x, y: SomeInteger): (int, int) =
    (x div y, x mod y)
  proc `min=`[T](x: var T; y: T): bool {.discardable.} =
    if x > y:
      x = y
      return true
    else:
      return false
  proc `max=`[T](x: var T; y: T): bool {.discardable.} =
    if x < y:
      x = y
      return true
    else:
      return false

  when NimMajor <= 0 and NimMinor <= 17:
    iterator pairs(n: NimNode): (int, NimNode) {.inline.} =
      for i in 0 ..< n.len:
        yield (i, n[i])

  #[
  when NimMajor <= 0 and NimMinor <= 18:
    macro parseInnerType(x: NimNode): untyped =
      newIdentNode("parse" & x[1][1].repr)
  else:
    macro parseInnerType(x: typedesc): untyped =
      newIdentNode("parse" & x.getType[1][1].repr)
  ]#

  proc parseInnerType(x: NimNode): NimNode =
    newIdentNode("parse" & x[1].repr)

  proc inputAsTuple(ty: NimNode): NimNode =
    result = nnkStmtListExpr.newTree()
    t := genSym()
    result.add quote do: (let `t` = stdin.readLine.split)
    p := nnkPar.newTree()
    for i, typ_tmp in ty.pairs:
      var ece, typ: NimNode
      if typ_tmp.kind == nnkExprColonExpr:
        ece = nnkExprColonExpr.newTree(typ_tmp[0])
        typ = typ_tmp[1]
      else:
        ece = nnkExprColonExpr.newTree(ident("f" & $i))
        typ = typ_tmp
      if typ.repr == "string":
        ece.add quote do: `t`[`i`]
      else:
        parsefn := newIdentNode("parse" & typ.repr)
        ece.add quote do: `t`[`i`].`parsefn`
      p.add ece
    result.add p

  macro inputAsType(ty: untyped): untyped =
    if ty.kind == nnkBracketExpr:
      if ty[1].repr == "string":
        return quote do: stdin.readLine.split
      else:
        parsefn := parseInnerType(ty)
        return quote do: stdin.readLine.split.map(`parsefn`)
        #[
          when NimMajor <= 0 and NimMinor <= 18:
            stdin.readLine.split.map(parseInnerType(ty.getType))
          else:
            stdin.readLine.split.map(parseInnerType(ty))
        ]#
    elif ty.kind == nnkPar:
      return inputAsTuple(ty)
    elif ty.repr == "string":
      return quote do: stdin.readLine
    else:
      parsefn := ident("parse" & ty.repr)
      return quote do: stdin.readLine.`parsefn`

  macro input(query: untyped): untyped =
    doAssert query.kind == nnkStmtList
    result = nnkStmtList.newTree()
    letSect := nnkLetSection.newTree()
    for defs in query:
      if defs[0].kind == nnkIdent:
        tmp := nnkIdentDefs.newTree(defs[0], newEmptyNode())
        typ := defs[1][0]
        var val: NimNode
        if typ.len <= 2:
          val = quote do: inputAsType(`typ`)
        else:
          op := typ[2]
          typ.del(2, 1)
          val = quote do: inputAsType(`typ`).mapIt(`op`)
        if defs[1].len > 1:
          op := defs[1][1]
          it := ident"it"
          tmp.add quote do:
            block:
              var `it` = `val`
              `op`
        else:
          tmp.add val
        letSect.add tmp
      elif defs[0].kind == nnkPar:
        vt := nnkVarTuple.newTree()
        for id in defs[0]:
          vt.add id
        vt.add newEmptyNode()
        sle := nnkStmtListExpr.newTree()
        t := genSym()
        sle.add quote do: (let `t` = stdin.readLine.split)
        p := nnkPar.newTree()
        if defs[1][0].kind == nnkPar:
          for i, typ in defs[1][0].pairs:
            if typ.repr == "string":
              p.add quote do: `t`[`i`]
            else:
              parsefn := newIdentNode("parse" & typ.repr)
              p.add quote do: `t`[`i`].`parsefn`
        else:
          typ := defs[1][0]
          if typ.repr == "string":
            for i in 0..<defs[0].len:
              p.add quote do: `t`[`i`]
          else:
            parsefn := newIdentNode("parse" & typ.repr)
            for i in 0..<defs[0].len:
              p.add quote do: `t`[`i`].`parsefn`
        sle.add p
        vt.add sle
        letSect.add vt
      elif defs[0].kind == nnkBracketExpr:
        ids := nnkIdentDefs.newTree(defs[0][0], newEmptyNode())
        cnt := defs[0][1]
        typ := defs[1][0]
        var input: NimNode
        if typ.kind == nnkBracketExpr and typ.len > 2:
          op := typ[2]
          typ.del(2, 1)
          input = quote do: inputAsType(`typ`).mapIt(`op`)
        else:
          input = quote do: inputAsType(`typ`)
        var val: NimNode
        if defs[0].len > 2:
          op := defs[0][2]
          it := ident"it"
          val = quote do:
            block:
              var `it` = `input`
              `op`
        else:
          val = input
        if defs[1].len > 1:
          op := defs[1][1]
          it := ident"it"
          ids.add(quote do:
            block:
              var `it` = newSeqWith(`cnt`, `val`)
              `op`)
        else:
          ids.add(quote do: newSeqWith(`cnt`, `val`))
        letSect.add ids
    result.add letSect

  proc makeSeq[T, Idx](num: array[Idx, int]; init: T): auto =
    when num.len == 1:
      return newSeqWith(num[0], init)
    else:
      var tmp: array[num.len-1, int]
      for i, t in tmp.mpairs: t = num[i+1]
      return newSeqWith(num[0], makeSeq(tmp, init))

  proc parseInt1(str: string): int =
    str.parseInt - 1

# ========= utils/base.nim ========= }}}

# ========= math/modint.nim ========= {{{

# ========= math/mathMod.nim ========= {{{

when not declared(INCLUDE_GUARD_MATH_MATHMOD_NIM):
  const INCLUDE_GUARD_MATH_MATHMOD_NIM = 1
  proc `mod`(x, y: int): int {.inline.} =
    if x < 0:
      y - system.`mod`(-x, y)
    else:
      system.`mod`(x, y)

# ========= math/mathMod.nim ========= }}}


when not declared(INCLUDE_GUARD_MATH_MODINT_NIM):
  const INCLUDE_GUARD_MATH_MODINT_NIM = 1
  import math, sequtils
  import strutils

  proc extgcd(x, y: SomeInteger): (int, int) =
    if x < y:
      let (a, b) = extgcd(y, x)
      return (b, a)
    if y == 0 or x mod y == 0: return (0, 1)
    let (a, b) = extgcd(y, x mod y)
    return (b, -(x div y) * b + a)

  type ModInt[M: static[int]] = object
    v: int

  template initModInt(val: int): auto =
    when declared(MOD):
      ModInt[MOD](v: val mod MOD)
    else:
      ModInt[1000000007](v: val mod 1000000007)

  proc `$`[M](n: ModInt[M]): string {.inline.} =
    $n.v

  proc inv[M](n: ModInt[M]): ModInt[M] {.inline.} =
    result.v = (extgcd(n.v, M)[0]) mod M

  proc modinv(n: int; m: int): int {.inline.} =
    result = (extgcd(n, m)[0]) mod m

  proc `+`[M](n, m: ModInt[M]): ModInt[M] {.inline.} =
    result.v = (n.v + m.v)
    if result.v >= M: result.v -= M

  proc `+`[M](n: ModInt[M]; m: int): ModInt[M] {.inline.} =
    result.v = (n.v + m) mod M

  proc `*`[M](n, m: ModInt[M]): ModInt[M] {.inline.} =
    result.v = n.v * m.v mod M

  proc `*`[M](n: ModInt[M]; m: int): ModInt[M] {.inline.} =
    result.v = n.v * m mod M

  proc `-`[M](n: ModInt[M]): ModInt[M] {.inline.} =
    result.v = M - n.v

  proc `-`[M](n: ModInt[M]; m: int): ModInt[M] {.inline.} =
    result.v = (n.v - m) mod M

  proc `-`[M](n, m: ModInt[M]): ModInt[M] {.inline.} =
    result.v = (n.v - m.v) mod M

  proc `/`[M](n, m: ModInt[M]): ModInt[M] {.inline.} =
    n * inv(m)

  proc `/`[M](n: ModInt[M]; m: int): ModInt[M] {.inline.} =
    n / initModInt(m)

  proc `+=`[M](n: var ModInt[M]; m: int|ModInt[M]) {.inline.} =
    n = n + m

  proc `-=`[M](n: var ModInt[M]; m: int|ModInt[M]) {.inline.} =
    n = n - m

  proc `*=`[M](n: var ModInt[M]; m: int|ModInt[M]) {.inline.} =
    n = n * m

  proc `/=`[M](n: var ModInt[M]; m: int|ModInt[M]) {.inline.} =
    n = n / m

  proc fac[M](n: ModInt[M]): ModInt[M] =
    result.v = 1
    for i in 2..n.v:
      result.v = result.v * i mod M

  proc perm[M](n, m: ModInt[M]): ModInt[M] =
    result.v = 1
    for i in n.v-m.v+1..n.v:
      result.v = result.v * i mod M

  proc binom[M](n, m: ModInt[M]): ModInt[M] {.inline.} =
    perm(n, m) / (fac(m))

  proc modfac(n: int; M: static[int]): int =
    result = 1
    for i in 2..n:
      result = result * i mod M

  proc modperm(n, m: int; M: static[int]): int =
    result = 1
    for i in n-m+1..n:
      result = result * i mod M

  proc modbinom(n, m: int; M: static[int]): int {.inline.} =
    modperm(n, m, M) / (modfac(m, M))

  proc garner(args: openArray[(int, int)]; modulo = -1): (int, int) =
    result = (1, 0)
    let n = args.len
    var coe, con = newSeq[int](n)
    for c in coe.mitems:
      c = 1
    for i in 0..<n:
      let t = (args[i][1] - con[i]) * modinv(coe[i], args[i][0]) mod args[i][0]
      for k in i+1 ..< n:
        con[k] = (con[k] + coe[k] * t) mod args[k][0]
        coe[k] = coe[k] * args[i][0] mod args[k][0]
      result[1] = result[1] + result[0] * t
      result[0] = result[0] * args[i][0]
      if modulo > 0:
        result[0] = result[0] mod modulo
        result[1] = result[1] mod modulo
    if modulo > 0: result[0] = modulo

  proc garner(args: openArray[(int, seq[int])]; modulo = -1): (int, seq[int]) =
    let P = args[0][1].len
    result = (1, newSeq[int](P))
    let n = args.len
    var
      coe = newSeq[int](n)
      con = newSeqWith(n, newSeq[int](P))
    for c in coe.mitems:
      c = 1
    for i in 0..<n:
      for p in 0..<P:
        let t = (args[i][1][p] - con[i][p]) * modinv(coe[i], args[i][
            0]) mod args[i][0]
        for k in i+1 ..< n:
          con[k][p] = (con[k][p] + coe[k] * t mod args[k][0]) mod args[k][0]
        if modulo > 0:
          result[1][p] = (result[1][p] + result[0] * t mod modulo) mod modulo
        else:
          result[1][p] = (result[1][p] + result[0] * t)
      for k in i+1 ..< n:
        coe[k] = coe[k] * args[i][0] mod args[k][0]
      result[0] = result[0] * args[i][0] mod modulo
      if modulo > 0:
        result[0] = result[0] mod modulo
    if modulo > 0: result[0] = modulo

  proc modpow(n, p, m: int): int =
    var
      p = p
      t = n
    result = 1
    while p > 0:
      if (p and 1) == 1:
        result = result * t mod m
      t = t * t mod m
      p = p shr 1

  proc pow[M: static[int]](n: ModInt[M]; p: int): ModInt[M] =
    ModInt[M](v: modpow(n.v, p, M))

  template parseModInt(x: string): ModInt =
    initModInt(x.parseInt)

# ========= math/modint.nim ========= }}}

input:
  (H, W): int
  SS[H]: string

let
  S = SS.mapIt(it.mapIt(it == '#'))

var
  nanachi, snuke = makeSeq([H+1, W+2], 0)
  ramen, memma = makeSeq([H+2, W+1], 0)

for i in 1..H:
  for k in range(W):
    if not S[i-1][k]:
      nanachi[i][k+1] = nanachi[i][k] + 1
  for k in countdown(W, 1):
    if not S[i-1][k-1]:
      snuke[i][k] = snuke[i][k+1] + 1

for k in 1..W:
  for i in range(H):
    if not S[i][k-1]:
      ramen[i+1][k] = ramen[i][k] + 1
  for i in countdown(H, 1):
    if not S[i-1][k-1]:
      memma[i][k] = memma[i+1][k] + 1

var
  res = initModInt(0)

let
  two = initModInt(2)
  K = SS.mapIt(it.count('.')).sum
  aa = pow(two, K)

var
  p = newSeq[ModInt[1000000007]](K+1)

p[0] += 1

for i in range(K):
  p[i+1] = p[i] * 2

for i in 1..H:
  for k in 1..W:
    let t = (nanachi[i][k] + snuke[i][k] + ramen[i][k] + memma[i][k] - int(
        not S[i-1][k-1]) * 3)
    # stderr.writeLine $t
    # res += bino[t] * pow(two, K - t)
    res += aa - p[K - t]

echo res

# stderr.writeLine $nanachi
# stderr.writeLine $snuke
# stderr.writeLine $ramen
# stderr.writeLine $memma
