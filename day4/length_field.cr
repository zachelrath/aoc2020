
require "./field"

class LengthField < Field

    @valid_lengths : Array(Tuple(String, Int32, Int32))

    def initialize(name : String, valid_lengths : Array(Tuple(String, Int32, Int32)))
        super name
        @valid_lengths = valid_lengths
    end

    def is_valid?(input : String)
        @valid_lengths.each do |length_def|
            unit = length_def[0]
            min = length_def[1]
            max = length_def[2]
            if input.index(unit) != nil
                int_val = input.sub(unit, "").strip.to_i32?
                if int_val.nil?
                    return false
                else
                    # if the value is a valid Int32,
                    # then check if it between the min and max value
                    if int_val >= min && int_val <= max
                        return true
                    end
                end
                
                # if we got here, and the input is not valid,
                # don't bother validating against the other units
                return false
            end
            # continue on to other length units
        end
        return false
    end
    
end