
require "option_parser"
require "./passport"

part_b = false

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to day 4"

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
    passports = [] of Passport
    cur_lines = [] of String
    File.each_line(file) do |line|
        # If we come to an empty line,
        # we're done with the current passport
        if line.size == 0
           passports << Passport.new cur_lines
           cur_lines = [] of String
        else
            line.strip().split(" ").each { |p| cur_lines << p }
        end
    end

    if cur_lines.size > 0
        passports << Passport.new cur_lines
    end

    puts passports.count do |p| { p.has_all_required_fields? && (!part_b || p.has_valid_field_values?) }

    exit
  end
end