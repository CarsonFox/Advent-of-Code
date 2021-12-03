function day3()
  input = [[parse(Int, c) for c in line] for line in readlines("src/day3.input")]
  avg = length(input) ÷ 2

  shift_add(acc, x) = acc << 1 + x

  input_sum = sum(input)
  γ = foldl(shift_add, [x > avg ? 1 : 0 for x in input_sum])
  ϵ = foldl(shift_add, [x ≤ avg ? 1 : 0 for x in input_sum])

  println(γ * ϵ)

  #Part 2
  function oxygen_criteria(n, input)
    bit = (sum(input)[n] ≥ length(input) / 2) ? 1 : 0
    filter(row -> row[n] == bit, input)
  end

  function CO2_criteria(n, input)
    bit = (sum(input)[n] ≥ length(input) / 2) ? 0 : 1
    filter(row -> row[n] == bit, input)
  end

  function rating(input, criteria, n=1)
    if length(input) == 1
      first(input)
    else
      rating(criteria(n, input), criteria, n + 1)
    end
  end

  oxygen_rating = foldl(shift_add, rating(input, oxygen_criteria))
  CO2_rating = foldl(shift_add, rating(input, CO2_criteria))

  println(oxygen_rating * CO2_rating)
end
