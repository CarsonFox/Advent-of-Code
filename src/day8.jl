function day8()
    input = readlines("src/input/day8")

    #Part 1
    unique_digits(str) = count(s -> length(s) ∈ (2, 3, 4, 7), split(str))
    (unique_digits(o) for (_, o) in split.(input, "|")) |> sum |> println
end