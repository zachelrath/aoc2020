module Password
    extend self

    # takes an input password and policy such as "1-3 a: abcde"
    # and determines whether the password matches the given policy
    def is_valid?(input : String)

        # split into parts policy and password
        parts = input.split(" ")

        min_max = parts[0].split("-")
        min = min_max[0].to_i32
        max = min_max[1].to_i32

        target_char = parts[1][0,1]
        password = parts[2].strip

        # test the password against the regex
        occurs = password.count(target_char)

        occurs >= min && occurs <= max

    end

end