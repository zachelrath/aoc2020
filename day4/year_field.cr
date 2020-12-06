
require "./field"

class YearField < Field

    getter min : Int32
    getter max : Int32

    def initialize(name : String, @min, @max)
        super name
    end

    def is_valid?(input : String)
        int_value = input.to_i32?
        return !int_value.nil? && (int_value >= @min) && (int_value <= @max)
    end
    
end