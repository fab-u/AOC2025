using BenchmarkTools

function main()
    input = read("input.txt", String)

    # input preparation
    ranges = split(input, ",")

    sum = 0
    for r in ranges
        min, max = parse.(Int, split(r, "-"))

        for i in min:max
            istr = string(i) 
            if length(istr) % 2 == 0
                midpoint = div(length(istr), 2)

                if istr[begin: midpoint] == istr[midpoint+1: end]
                    sum += parse(Int, istr)
                end
            end
        end
    end
    println(sum)
end

# @btime main()

# PART 2

function divisors(number)
    divisors = []
    for i in 2:floor(Int, sqrt(number))
        println(i)
        if number % i == 0
            push!(divisors, i)
            if div(number, i) != i 
                push!(divisors, div(number, i)) 
            end
        end
    end
    return divisors
end

function test_divisors()
    for i in [10, 15, 24, 360]
        println("Divisors of $(i) are $(divisors(i))")
    end
end

test_divisors()

function part2()
    input = read("input.txt", String)

    ranges = split(input, ",")

    sum = 0

end
