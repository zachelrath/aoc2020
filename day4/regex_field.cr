
require "./field"

class RegexField < Field

    @pattern : Regex

    def initialize(name : String, pattern : Regex)
        super name
        @pattern = pattern
    end

    def is_valid?(input : String)
        return !(input =~ @pattern).nil?
    end
    
end