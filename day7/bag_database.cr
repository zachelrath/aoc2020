require "./bag"

class BagDatabase

    all_bags : Array(Bag)
    by_color : Hash(String, Bag)

    def initialize(@all_bags : Array(Bag))
        # parse the file into a hash of Bag types by color
        @by_color = {} of String => Bag
        @all_bags.each do |bag|
            @by_color[bag.color] = bag
        end
    end

    # QUERIES

    # find bags that may contain a given bag color
    def can_contain(bag_color : String)
        # record which bags may contain our target color
        matches = [] of Bag
        iter_colors = [bag_color]
        # find all bags that can directly contain target color
        # then find all bags that can directly contain THOSE
        # then find all bags that can directly contain THOSE
        while true
            # find bags that can contain any of the target colors
            direct_contains = @all_bags.select { |bag| bag.can_contain?(iter_colors) }
            # puts iterations.to_s + ") direct contains: " + direct_contains.to_s
            if direct_contains.size == 0
                break
            end
            # Add these bags to our matches
            matches = matches | direct_contains
            # Next, check for bags that can contain any of these bags' colors
            iter_colors = direct_contains.map { |b| b.color }
        end
        matches
    end

    def count_required_child_bags(color : String)
        bag = @by_color[color]
        initial = 0.to_i64
        if bag.contents.size == 0
            return initial
        else
            child_amounts = bag.contents.map do | color, amt |
                amt + (amt * count_required_child_bags(color))
            end
            return child_amounts.sum(initial)
        end
    end

    # STATICS
    def self.from(file_name : String)
        BagDatabase.new File.read_lines(file_name).map { |line| Bag.from(line) }
    end

end