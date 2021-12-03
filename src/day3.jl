function day3()
  input = [[parse(Int, c) for c in line] for line in readlines("src/day3.input")]
  avg = length(input) ÷ 2

  shift_add(acc, x) = acc << 1 + x
  decode_binary(digits) = foldl(shift_add, digits)

  input_sum = sum(input)
  γ = decode_binary([x > avg ? 1 : 0 for x in input_sum])
  ϵ = decode_binary([x ≤ avg ? 1 : 0 for x in input_sum])

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

  oxygen_rating = decode_binary(rating(input, oxygen_criteria))
  CO2_rating = decode_binary(rating(input, CO2_criteria))

  println(oxygen_rating * CO2_rating)
end
