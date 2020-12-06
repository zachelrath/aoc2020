require "spec"
require "../year_field"

describe YearField do
  describe "#is_valid?" do
    it "validates inputs against a YearField schema" do
        f = YearField.new("efr", 2020, 2041)
        # super should be called
        f.name.should eq "efr"
        f.is_valid?("aaa").should be_false # not a year
        f.is_valid?("2019").should be_false # too low
        f.is_valid?("2020").should be_true
        f.is_valid?("2041").should be_true
        f.is_valid?("2042").should be_false # too high
    end
  end

end