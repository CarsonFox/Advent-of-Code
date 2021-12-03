function day2()
  function parseln(line)
    cmd, x = split(line)
    Val(Symbol(cmd)), parse(Int, x)
  end

  input = map(parseln, readlines("src/day2.input"))

  #Part 1
  decode(::Val{:forward}, x) = [x, 0]
  decode(::Val{:down}, x) = [0, x]
  decode(::Val{:up}, x) = [0, -x]

  ans = reduce(*, sum([decode(cmd, x) for (cmd, x) in input]))
  println(ans)

  #Part 2
  decode_aim(_, _) = 0
  decode_aim(::Val{:down}, x) = x
  decode_aim(::Val{:up}, x) = -x
  
  decode_forward(_, _) = 0
  decode_forward(::Val{:forward}, x) = x

  aim = accumulate(+, [decode_aim(cmd, x) for (cmd, x) in input])
  horizontal_Δ = [decode_forward(cmd, x) for (cmd, x) in input]

  final_pos = sum(horizontal_Δ)
  final_depth = sum(horizontal_Δ .* aim)

  println(final_pos * final_depth)
end
