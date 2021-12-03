function day2()
  function parseln(line)
    command, val = split(line)
    Val(Symbol(command)), parse(Int, val)
  end

  input = map(parseln, readlines("src/day2.input"))

  #Part 1
  decode(::Val{:forward}, val) = [val, 0]
  decode(::Val{:down}, val) = [0, val]
  decode(::Val{:up}, val) = [0, -val]

  ans = reduce(*, sum([decode(cmd, val) for (cmd, val) in input]))
  println(ans)

  #Part 2
  decode_aim(_, _) = 0
  decode_aim(::Val{:down}, val) = val
  decode_aim(::Val{:up}, val) = -val
  
  decode_forward(_, _) = 0
  decode_forward(::Val{:forward}, val) = val

  aim = accumulate(+, [decode_aim(command, val) for (command, val) in input])
  horizontal_Δ = [decode_forward(command, val) for (command, val) in input]

  final_pos = sum(horizontal_Δ)
  final_depth = sum(horizontal_Δ .* aim)

  println(final_pos * final_depth)
end
