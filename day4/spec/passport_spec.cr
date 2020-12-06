require "spec"
require "../passport"

describe Passport do
  describe "#is_valid?" do
    it "validates a Passport for required fields" do
        # valid - has all required fields
        Passport.new([
            "ecl:gry",
            "pid:860033327",
            "eyr:2020",
            "hcl:#fffffd",
            "byr:1937",
            "iyr:2017",
            "cid:147",
            "hgt:183cm"
        ]).has_all_required_fields?().should be_true
        # invalid - missing height
        Passport.new([
            "iyr:2013",
            "ecl:amb",
            "cid:350",
            "eyr:2023",
            "pid:028048884",
            "hcl:#cfa07d",
            "byr:1929"
        ]).has_all_required_fields?().should be_false
    end
  end

end