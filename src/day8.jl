function day8()
    input = readlines("src/input/day8")

    #Part 1
    unique_digits(str) = count(s -> length(s) ∈ (2, 3, 4, 7), split(str))
    (unique_digits(o) for (_, o) in split.(input, "|")) |> sum |> println

    #Part 2
    function encoding(segments)
        digits = Set.(split(segments))
        digits_of_length(n) = filter(d -> length(d) == n, digits)

        one = only(digits_of_length(2))
        four = only(digits_of_length(4))
        seven = only(digits_of_length(3))
        eight = only(digits_of_length(7))

        nine = only(filter(
            d -> length(setdiff(d, four ∪ seven)) == 1,
            digits_of_length(6)))
        g = setdiff(nine, four, seven)
        e = setdiff(eight, nine)

        a = setdiff(seven, one)
        f = intersect(filter(d -> length(d) != 5, digits)...)

        mapping = Dict(
            zero => "0",
            one => "1",
            two => "2",
            three => "3",
            four => "4",
            five => "5",
            six => "6",
            seven => "7",
            eight => "8",
            nine => "9",
        )
    end

    encoding("abcefg cf acdeg acdfg bcdf abdfg abdefg acf abcdefg abcdfg")

    # function decode(line)
    #     patterns, digits = split(line, "|")
    #     parse(Int, join(encoding(patterns).(digits)))
    # end

    # println(sum(decode.(input)))
end