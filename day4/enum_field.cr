
require "./field"

class EnumField < Field

    @possible_values : Set(String)

    def initialize(name : String, @possible_values)
        super name
    end

    def is_valid?(input : String)
        return @possible_values.includes? input
    end
    
end