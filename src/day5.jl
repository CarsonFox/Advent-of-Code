function day5()
  input = readlines("src/day5.input")

  function parse_pair(line)
    map.(pair -> parse.(Int, pair) .+ 1,
         split.(split(line, "->"), ","))
  end

  function symmetric_range(x, y)
    step = x == y ? 1 : sign(y - x)
    x:step:y
  end

  function line((a, b))
    CartesianIndex.(symmetric_range(a[1], b[1]), symmetric_range(a[2], b[2]))
  end

  pairs = parse_pair.(input)

  #Part 1
  straight((a, b)) = a[1] == b[1] || a[2] == b[2]
  straight_lines = line.(filter(straight, pairs))
  field = zeros(Int, 1000, 1000)

  foreach.(coord -> field[coord] += 1, straight_lines)
  println(sum(field .≥ 2))

  #Part 2
  lines = line.(pairs)
  field = zeros(Int, 1000, 1000)

  foreach.(coord -> field[coord] += 1, lines)
  println(sum(field .≥ 2))
end
