
require "option_parser"
require "./processor"

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to day 9"

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-i <file>", "--input <file>", "Input file" do |file|
    unless File.file? file
      puts "Invalid file"
      exit
    end

    commands = File.read_lines(file).map { |line| line.to_i64 }

    parts = Processor.part1(25, commands)
    target_val = parts[0]
    target_idx = parts[1]
    puts "part 1: " + target_val.to_s + ", found at index: " + target_idx.to_s
    
    # part 2 --- find a contiguous set of numbers from same input which sums to p1 result
    # and then add the SMALLEST and LARGEST from that set
    p2 = Processor.part2(target_idx, target_val, commands)
    puts "part 2: " + p2.to_s

    exit
    

  end
end