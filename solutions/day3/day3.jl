using BenchmarkTools

string_parser(s) = parse.(Int, collect(s))
banks = string_parser.(readlines("input.txt"))

function maximum_joltage(n_batteries)
    sum = 0

    for bank in banks
        index = 0
        for i in (n_batteries-1):-1:0
            index += argmax(bank[index+1: end-i])
            sum += bank[index] * 10^i
        end
    end

    println(sum)
end

@btime maximum_joltage(2)
@btime maximum_joltage(12)
