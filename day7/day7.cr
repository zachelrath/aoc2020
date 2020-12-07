
require "option_parser"
require "./bag_database"

option_parser = OptionParser.parse do |parser|
  parser.banner = "Welcome to day 6"

  parser.on "-h", "--help", "Show help" do
    puts parser
    exit
  end
  parser.on "-i <file>", "--input <file>", "Input file" do |file|
    unless File.file? file
      puts "Invalid file"
      exit
    end

    db = BagDatabase.from(file)

    puts "part 1 (bags that can contain Shiny Gold): " + db.can_contain("shiny gold").size.to_s

    puts "part 2 (# of bags needed in a Shiny Gold): " + db.count_required_child_bags("shiny gold").to_s
    
    

    exit

  end
end