
require "./instruction"

class StateMachine

    instructions : Array(Instruction)
    state : Int64
    curr_instruction_idx : Int32
    # <state, Instruction, times instruction executed>
    history : Array(Tuple(Int64, Instruction, Int32))
    is_terminated : Bool

    def initialize(@instructions : Array(Instruction))
        @history = [] of Tuple(Int64, Instruction, Int32)
        @curr_instruction_idx = 0
        @state = Int64.new(0)
        @is_terminated = false
        @instructions.each { |i| i.reset }
    end

    def has_events?()
      @history.size > 0
    end

    def get_last_event()
      @history[@history.size - 1]
    end

    def num_instructions()
      @instructions.size
    end

    def forward()

      if is_done?
        return
      end

      # puts "curr idx is " + @curr_instruction_idx.to_s

        curr_instruction = @instructions[@curr_instruction_idx]
        # increment the times the instruction occurred
        curr_instruction.perform

        case curr_instruction.op_type
        when "acc"
          # puts "adding " + curr_instruction.data.to_s + " to our state of " + @state.to_s
          @state += curr_instruction.data.to_i64
          # advance to the instruction below
          @curr_instruction_idx += 1
        when "jmp"
          # puts "JUMPING from " + @curr_instruction_idx.to_s + " to " + (@curr_instruction_idx + curr_instruction.data).to_s
          # Advance to the instruction at index given by jmp command data
          @curr_instruction_idx += curr_instruction.data
        when "nop"
          # puts "NO OP"
          # advance to the instruction below
          @curr_instruction_idx += 1
        end

        # log current state and instruction to our log
        @history << {@state, curr_instruction, curr_instruction.times_executed}

        # If we are at the end, halt the program
        if @curr_instruction_idx >= @instructions.size
          @is_terminated = true
        end
    end

    def is_done?()
      @is_terminated
    end

    def run()
      while !is_done? && (!has_events? || get_last_event[2] < 2)
        forward
      end
    end

    def get_state() 
      @state
    end

    def get_previous_state()
      # go grab the state of the next-to-last event
      @history[@history.size - 2][0]
    end

     # STATICS
     def self.from(file_name : String)
      StateMachine.new File.read_lines(file_name).map { |line| Instruction.from(line) }
  end

end