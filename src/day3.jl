function day3()
  input = [[parse(Int, c) for c in line] for line in readlines("src/day3.input")]
  avg = length(input) ÷ 2

  shift_add(acc, x) = acc << 1 + x

  input_sum = sum(input)
  γ = foldl(shift_add, [x > avg ? 1 : 0 for x in input_sum])
  ϵ = foldl(shift_add, [x ≤ avg ? 1 : 0 for x in input_sum])

  println(γ * ϵ)
end
