
require "option_parser"
require "./password"
require "./passwordb"

part_b = false

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to day 2"

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
    valid_passwords = 0
    File.each_line(file) do |line|
        if part_b
            if PasswordB.is_valid?(line)
                valid_passwords += 1
            end
        else
            if Password.is_valid?(line)
                valid_passwords += 1
            end
        end      
    end
    puts valid_passwords
    exit
  end
end