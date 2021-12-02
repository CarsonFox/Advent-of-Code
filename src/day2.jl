function day2()
  function parseln(line)
    command, val = split(line)
    Val(Symbol(command)), parse(Int, val)
  end

  input = map(parseln, readlines("src/day2.input"))

  decode(command::Val{:forward}, val) = [val, 0]
  decode(command::Val{:down}, val) = [0, val]
  decode(command::Val{:up}, val) = [0, -val]

  ans = reduce(*, sum([decode(cmd, val) for (cmd, val) in input]))
  println(ans)
end
