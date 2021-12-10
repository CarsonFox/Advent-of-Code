function day7()
    crabs = parse.(Int, split(readline("src/day7.input"), ","))
    a, b = extrema(crabs)

    #Part 1
    fuel(pos) = sum(abs.(crabs .- pos))
    println(minimum(fuel.(a:b)))

    #Part 2
    sum_n(n) = n * (n+1) ÷ 2
    fuel_2(pos) = sum(crabs .- pos .|> abs .|> sum_n)
    println(minimum(fuel_2.(a:b)))
end