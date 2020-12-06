
class Passport

    @@required_fields = [
        "byr", # (Birth Year)
        "iyr", # (Issue Year)
        "eyr", # (Expiration Year)
        "hgt", # (Height)
        "hcl", # (Hair Color)
        "ecl", # (Eye Color)
        "pid", # (Passport ID)
    ]

    @@optional_fields = [
        "cid", # (Country ID)
    ]

    def initialize(fieldValues : Array(String))
        @fields = {} of String => String
        fieldValues.each do |fieldValue|
            parts = fieldValue.split(":")
            @fields[parts[0]] = parts[1]
        end
    end

    def has_all_required_fields?()
        @@required_fields.each do |field|
            if !@fields.has_key?(field)
                return false
            end
        end
        return true
    end
end