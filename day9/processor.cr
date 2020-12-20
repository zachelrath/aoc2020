class Processor

    def self.part1(look_behind : Int32, input : Array(Int64))

        # e.g. if look_behind is 5, start at index 5,
        # so that in the first loop iteration we look at [0, 5],
        # and in second iteration we look at [1,6], etc.
        idx = look_behind
        input_size = input.size

        while idx <= input_size
            target_val = input[idx]

            # look at all previous values in the input 
            # from [idx - look-behind, idx]
            # All combinations of numbers in this range must add up to target_val.
            # if any do NOT, then return target_val, we found the answer to part1
            range_start = idx - look_behind
            range_end = idx

            # to not have this problem be O(N ^ 3)
            # build a map of values we're seeking
            map = {} of Int64 => Bool
            # populate the values with 
            x = range_start
            while x < range_end
                # for example if target_val is 45 and all preceding 25 numbers were 1-25,
                # then look through all numbers 0-50
                map[input[x]] = true
                x += 1
            end

            # do the same loop but now check the map
            y = range_start
            found_match = false 
            while y < range_end
                complement = target_val - input[y]
                # if the current value's complement is in our map,
                # then we found a match, and we can move on to the next target_val 
                if map[complement]? == true
                    found_match = true
                    break
                end
                y += 1
            end

            # if we did not find a match,
            # then this is the answer to part 1
            if found_match == false
                return { target_val, idx }
            end

            # move to next
            idx += 1
        end

        return { Int64.new(0), idx }
    end

    def self.part2(target_idx_in_input : Int32, target_val : Int64, input : Array(Int64))

        # optimize by starting at the index where we found our target value,
        # and then working backward from there
        idx = target_idx_in_input - 1

        while idx > 0

            values_in_range = [] of Int64 
            current_sum = Int64.new(0)
            x = idx
            while current_sum < target_val
                current_val = input[x]
                values_in_range << current_val
                current_sum += current_val
                x -= 1
            end

            # if we found a contiguous range which sums to our target
            # we found what we are looking for, woo!
            # sort the numbers, and add the smallest to the largest to find 
            if current_sum == target_val
                sorted = values_in_range.sort
                return sorted[0] + sorted[sorted.size - 1]
            end

            # move forwards
            idx -= 1
        end

        return Int64.new(0)

    end

end