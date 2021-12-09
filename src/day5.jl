function day5()
  input = readlines("src/day5.input")

  function parseline(line)
    coord_pairs = split.(split(line, "->"), ",")
    #One-based indices
    offset = CartesianIndex(1, 1)
    map(pair -> CartesianIndex(parse.(Int, pair)...) + offset, coord_pairs)
  end

  indices = parseline.(input)

  straight((a, b)) = a[1] == b[1] || a[2] == b[2]
  line((a, b)) = a < b ? (a:b) : (b:a)

  straight_lines = map(line, filter(straight, indices))

  #VolksWagen
  field = zeros(Int, 1000, 1000)

  foreach.(coord -> field[coord] += 1, straight_lines)
  println(sum(field .≥ 2))
end
