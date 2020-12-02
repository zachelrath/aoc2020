require "option_parser"

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to the day 1 app, part 2"

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-i <file>", "--input <file>", "Input file" do |file|
    # we want to iterate over all numbers and spit out 
    # complements = Set(Int32).new
    # 2020 = 979 + 366 + 675
    # 2020 - 979 = 1041 => { 366, 675 }
    # 2020 - 366 = 1748

    # 2020 - x1 = 1041
    # 2020 - x2 = 

    unless File.file? file
      puts "Invalid file"
      exit
    end

    values = [] of Int32

    File.each_line(file) do |line|
      values << line.to_i32
    end

    complements = {} of Int32 => {Int32, Int32}

    values.each do |i|
        values.each do |j|
            complements[i + j] = {i,j}
        end
    end

    values.each do |i|
        target = 2020 - i
        if complements.has_key?(target)
            parts = complements[target]
            puts i * parts[0] * parts[1]
            exit
        end
    end

    puts "Found NO match"
    exit
  end
end