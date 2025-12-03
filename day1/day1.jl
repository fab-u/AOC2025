input = readlines("input.txt")
# input = readlines("testinput.txt")

function instruction_parser(instruction)
    direction = instruction[1]
    number = parse(Int, instruction[2:end])

    return direction == 'R' ? number : -number
end
instructions = instruction_parser.(input)
println("maximum step", maximum(abs.(instructions)))

# Part 1 ##################
position = 50
zeros = 0

for instruction in instructions
    global position += instruction

    if position % 100 == 0
       global zeros += 1 
    end
end

println(zeros)

# Part 2 ###################
position = 50
zeros = 0

for instruction in instructions
    print = false

    previous_position = position
    global position += instruction

    # calculate how many times the zero was crossed
    crossings = fld(position, 100)
    if (previous_position == 0) && (crossings < 0)
        crossings += 1
    end

    # add a zero if the dial is on zero
    if position == 0
        global zeros += 1 
    end

    # if previous_position == 0
    #     print=true
    # end

    if crossings != 0
        print=true
    end

    if print
        println("--- Instruction $(previous_position) $(instruction) -----------------")
        println("Raw position: $(position)")
        println("Zero crossigs: $(crossings)")
        println("Modulo adjusted position: $(mod(position,100))")
    end 

    global zeros += abs(crossings)
    global position = mod(position, 100)
end

println(zeros)

### TEST ########################
input = readlines("input.txt")

instruction_parser(instr) = (instr[1] == 'R' ? 1 : -1) * parse(Int, instr[2:end])
instructions = instruction_parser.(input)

unwrapped = 50       # can grow beyond 0..99
zeros = 0

for step in instructions
    prev = unwrapped
    unwrapped += step

    # count how many multiples of 100 we passed
    zeros += abs(div(unwrapped, 100) - div(prev, 100))

    # add if we land exactly on zero
    if mod(unwrapped, 100) == 0
        zeros += 1
    end
end

println(zeros)
