require "option_parser"

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to the day 1 app"

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-i <file>", "--input <file>", "Input file" do |file|
    complements = Set(Int32).new
    unless File.file? file
      puts "Invalid file"
      exit
    end
    File.each_line(file) do |line|
      int_val = line.to_i32
      target = 2020 - int_val
      if complements.includes?(target)
        puts int_val * target
        exit
      else 
        complements.add(int_val)
      end
    end
    puts "Found NO match"
    exit
  end
end