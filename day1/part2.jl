import DSP

input = [parse(Int, line) for line in readlines()]

adjacent_pairs(collection) = zip(collection, Iterators.drop(collection, 1))
increasing(pair) = pair[1] < pair[2]

sums = DSP.conv(input, [1, 1, 1])[3:end-2]
num_increasing = count(increasing, adjacent_pairs(sums))

println(num_increasing)
