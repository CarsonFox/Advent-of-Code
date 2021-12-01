input = [parse(Int, line) for line in readlines()]

adjacent_pairs(collection) = zip(collection, Iterators.drop(collection, 1))
increasing(pair) = pair[1] < pair[2]

num_increasing = count(increasing, adjacent_pairs(input))
println(num_increasing)
