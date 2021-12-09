using Memoize

function day6()
    inital_state = parse.(Int, split(readline("src/day6.input"), ","))

    #Part 1
    function simulate(n)
        state = copy(inital_state)

        for _ in 1:n
            state .-= 1
            new = state .== -1

            state[new] .= 6
            append!(state, fill(8, count(new)))
        end
        
        state
    end

    println(length(simulate(80)))

    #Part 2
    @memoize function fish_with_value(days, n)
        if days == 0
            count(inital_state .== n)
        elseif n == 6
            sum(fish_with_value.(days - 1, (0, 7)))
        elseif n == 8
            fish_with_value(days - 1, 0)
        else
            fish_with_value(days - 1, n + 1)
        end
    end

    fish(n) = sum(fish_with_value.(n, 0:8))

    println(fish(256))
end