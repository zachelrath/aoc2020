require "spec"
require "../passport"

describe Passport do
  describe "#has_all_required_fields?" do
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

  describe "#has_valid_field_values?" do
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
    it "validates that all fields match schemas" do
      # valid passports
      [
        Passport.new([
          "pid:087499704",
          "hgt:74in",
          "ecl:grn",
          "iyr:2012",
          "eyr:2030",
          "byr:1980",
          "hcl:#623a2f",
        ]),
        Passport.new([
          "eyr:2029",
          "ecl:blu",
          "cid:129",
          "byr:1989",
          "iyr:2014",
          "pid:896056539",
          "hcl:#a97842",
          "hgt:165cm",
        ]),
        Passport.new([
          "hcl:#888785",
          "hgt:164cm",
          "byr:2001",
          "iyr:2015",
          "cid:88",
          "pid:545766238",
          "ecl:hzl",
          "eyr:2022",
        ]),
        Passport.new([
          "eyr:2029",
          "ecl:blu",
          "cid:129",
          "byr:1989",
          "iyr:2014",
          "pid:896056539",
          "hcl:#a97842",
          "hgt:165cm",
        ]),
      ].each { |p| p.has_valid_field_values?().should be_true }
      # invalid passports
      [
        Passport.new([
          "eyr:1972",
          "cid:100",
          "hcl:#18171d",
          "ecl:amb",
          "hgt:170",
          "pid:186cm",
          "iyr:2018",
          "byr:1926",
        ]),
        Passport.new([
          "iyr:2019",
          "hcl:#602927",
          "eyr:1967",
          "hgt:170cm",
          "ecl:grn",
          "pid:012533040",
          "byr:1946"
        ]),
        Passport.new([
          "hcl:dab227",
          "iyr:2012",
          "ecl:brn",
          "hgt:182cm",
          "pid:021572410",
          "eyr:2020",
          "byr:1992",
          "cid:277",
        ]),
        Passport.new([
          "hgt:59cm",
          "ecl:zzz",
          "eyr:2038",
          "hcl:74454a",
          "iyr:2023",
          "pid:3556412378",
          "byr:2007",
        ]),
      ].each { |p| p.has_valid_field_values?().should be_false }
    end
  end

end