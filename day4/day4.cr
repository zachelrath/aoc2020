
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

    num_valid = passports.count do |p|
        if part_b
            p.has_valid_field_values?
        else 
            p.has_all_required_fields?
        end
    end

    puts num_valid

    exit

  end
end