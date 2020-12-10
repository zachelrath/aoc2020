

class Instruction
    getter times_executed : Int32
    getter op_type : String
    getter data : Int32

    def initialize(@op_type : String, @data : Int32)
        @times_executed = 0
    end

    def reset()
        @times_executed = 0
    end

    def perform()
        @times_executed += 1
    end

    def undo()
        @times_executed -= 1
    end

    def swap_nop_or_jmp()
        if @op_type == "nop"
            @op_type = "jmp"
        elsif @op_type == "jmp"
            @op_type = "nop"
        end
    end

    def self.from(line : String)
       parts = line.split(" ")

       operation_type = parts[0]
       data = parts[1].to_i32

       Instruction.new(operation_type, data)
       
    end



end