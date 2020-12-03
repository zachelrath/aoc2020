
require "option_parser"
require "./datamap"

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
    # read lines into memory
    data_map = DataMap.new File.read_lines(file)

    # for part a and b both, do this traverse
    trees_encountered = data_map.traverse(3, 1).to_i64

    if part_b
      # for part b, traverse additional paths,
      # and multiply the totals together
      trees_encountered *= data_map.traverse(1, 1).to_i64
      trees_encountered *= data_map.traverse(5, 1).to_i64
      trees_encountered *= data_map.traverse(7, 1).to_i64
      trees_encountered *= data_map.traverse(1, 2).to_i64
    end

    puts trees_encountered
    exit
  end
end