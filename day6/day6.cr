
require "option_parser"

part_b = false

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to day 6"

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
    # read lines into memory, separated by newlines
    
    total_questions_answered = 0
    cur_group = [] of String
    last_intersect_returned_no_results = false
    File.each_line(file) do |line|
        # If we come to an empty line,
        # we're done with the current group
        if line.size == 0
            last_intersect_returned_no_results = false
            total_questions_answered += cur_group.size
            cur_group = [] of String
        else
            questions_answered = line.strip.split("")
            if cur_group.size == 0 && (!part_b || !last_intersect_returned_no_results)
                cur_group = questions_answered
            elsif part_b
                cur_group = cur_group & questions_answered
                # if the difference led to us having no common entries,
                # record this so that we don't inadvertently reset the group
                last_intersect_returned_no_results = cur_group.size == 0
            else
                cur_group = cur_group | questions_answered
            end
        end
    end

    total_questions_answered += cur_group.size

    puts total_questions_answered

    exit

  end
end