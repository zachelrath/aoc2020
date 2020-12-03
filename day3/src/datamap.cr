class DataMap

    def initialize(data : Array(String))
        @data = data
    end

    def traverse(numRight : Int32, numDown : Int32)
        line_number = 0
        column_number = 0
        trees_encountered = 0
        while line_number < @data.size
            line = @data[line_number]

            if line_number > 0 && line[column_number % line.size] == '#'
                trees_encountered += 1
            end 

            # increment
            line_number += numDown
            column_number += numRight
        end
        trees_encountered
    end
end