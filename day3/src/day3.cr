
require "option_parser"
# require "./password"

part_b = false

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to day 3"

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-b", "--partb", "Run part B" do
    part_b = true
  end
  parser.on "-i <file>", "--input <file>", "Input file" do |file|
    complements = Set(Int32).new
    unless File.file? file
      puts "Invalid file"
      exit
    end
    line_number = 0
    trees_encountered = 0
    File.each_line(file) do |line|
        if part_b
            
        else
            # skip first line
            if line_number != 0
              line_length = line.size
              index_to_check = (line_number * 3) % line_length
              # puts "line " + line_number.to_s + " checking index " + index_to_check.to_s + " is " + line[index_to_check]
              if line[index_to_check] == '#'
                  trees_encountered += 1
              end
            end
        end    
        line_number += 1  
    end
    puts trees_encountered
    exit
  end
end