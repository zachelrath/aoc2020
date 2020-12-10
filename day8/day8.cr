
require "option_parser"
require "./statemachine"

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to day 8"

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-i <file>", "--input <file>", "Input file" do |file|
    unless File.file? file
      puts "Invalid file"
      exit
    end

    instructions = File.read_lines(file).map { |line| Instruction.from(line) }

    part_1 = StateMachine.new instructions
    part_1.run()
    puts "part 1: " + part_1.get_previous_state().to_s

    # part b

    # find the nop or jmp instructions
    potential_bugs = instructions.select { |i| i.op_type == "nop" || i.op_type == "jmp" }

    potential_bugs.each do |i|
        # test to see if this is a nop or jmp and then swap if it is
        i.swap_nop_or_jmp()
        # build a new state machine with the altered instructions
        s = StateMachine.new(instructions)
        # run it until loop or done
        s.run()
        # If we successfully completed (vs looping infinitely),
        # we found the bug, so print out the state at the end
        if s.is_done?
            puts "part 2: " + s.get_state().to_s
            exit
        end

        # reset state
        i.swap_nop_or_jmp()
    end

  end
end