
require "./field"
require "./year_field"
require "./length_field"
require "./regex_field"
require "./enum_field"

class Passport

    @@required_fields = [
        YearField.new("byr", 1920, 2002),
        YearField.new("iyr", 2010, 2020),
        YearField.new("eyr", 2020, 2030),
        LengthField.new("hgt", [{"cm", 150, 193}, {"in", 59, 76}]),
        RegexField.new("hcl", /^#[0-9a-f]{6}$/),
        EnumField.new("ecl", Set{"amb","blu","brn","gry","grn","hzl","oth"}),
        RegexField.new("pid", /^[0-9]{9}$/),
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

    def has_field(field : Field)
        @fields.has_key?(field.name)
    end

    def has_all_required_fields?()
        @@required_fields.all? { |f| has_field f }
    end

    def has_valid_field_values?()
        @@required_fields.all? { |f| has_field(f) && f.is_valid?(@fields[f.name]) }
    end
end