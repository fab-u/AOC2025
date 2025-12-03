using BenchmarkTools

# PART 1 ################
function part1()
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

# PART 2 ##################
function divisors(number)
    divisors = [1]
    for i in 2:floor(Int, sqrt(number))
        # println(i)
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

function check_for_pattern(number::String, len)
    for i in 1:(div(length(number), len)-1)
        chunk = number[i*len + 1: (i+1)*len]
        # println(chunk, " ", number[1:len])
        if chunk != number[1: len]
            return false
        end
    end
    return true
end

function test_check_for_pattern()
    println(check_for_pattern("123123123", 3))
    println(check_for_pattern("12341234", 4))
    println(check_for_pattern("11111111", 4))
end

function part2()
    input = read("input.txt", String)

    ranges = split(input, ",")

    sum = 0
    for r in ranges
        min, max = parse.(Int, split(r, "-"))

        for i in min:max
            istr = string(i) 
            len = length(istr)
            if len == 1 
                continue
            end
            for divisor in divisors(len)
                if check_for_pattern(istr, divisor)
                    sum += parse(Int, istr)
                    println("Pattern of length $(divisor) found in $(istr)")
                    break
                end
            end
        end
    end
    println(sum)
end

# @btime part1()
# @btime part2()
# test_check_for_pattern()
# test_divisors()
part2()
