
class Bag

    getter color : String
    getter contents : Hash(String, Int64)

    def initialize(@color : String, @contents : Hash(String, Int64))
    end

    # return true if this bag can contain another target bag type
    def can_contain?(bag_color : String)
        @contents.has_key?(bag_color)
    end

    def can_contain?(bag_colors : Array(String))
        return bag_colors.any? { |c| @contents.has_key?(c) }
    end

    # parse a Bag from a file input line
    def self.from(line : String)
       # example
       # "clear coral bags contain 4 clear chartreuse bags, 2 bright olive bags."

       # split on " contain " 
       parts = line.chomp(".").split(" bags contain ")

        bag_color = parts[0]

        contents = {} of String => Int64

       # parse the allowed contents
       contents_str = parts[1]

       if contents_str != "no other bags"
            contents_str.split(", ").each do |content|
                # 2 shiny gold bags
                # 1 muted yellow bag
                child_parts = content.split(" ")
                child_color = child_parts[1] + " " + child_parts[2]
                amount = child_parts[0].to_i64
                contents[child_color] = amount
            end
       end

       Bag.new(bag_color, contents)
       
    end



end