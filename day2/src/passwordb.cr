module PasswordB
    extend self

    # takes an input password and policy such as "1-3 a: abcde"
    # and determines whether the password matches the given policy
    def is_valid?(input : String)

        # split into parts policy and password
        parts = input.split(" ")

        positions = parts[0].split("-")
        pos1 = positions[0].to_i32 - 1
        pos2 = positions[1].to_i32 - 1

        target_char = parts[1][0,1]
        password = parts[2].strip

        (password[pos1,1] == target_char)^(password[pos2,1] == target_char)

    end

end