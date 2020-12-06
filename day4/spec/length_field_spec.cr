require "spec"
require "../length_field"

describe LengthField do
  describe "#is_valid?" do
    it "validates inputs against a LengthField schema - cm" do
        # schema of cm or in
        f = LengthField.new("foo", [{"cm", 100, 200},{"in", 54, 78}])
        # super should be called
        f.name.should eq "foo"
        # cm
        f.is_valid?("99cm").should be_false # too low
        f.is_valid?("100cm").should be_true
        f.is_valid?("200cm").should be_true
        f.is_valid?("201cm").should be_false # too high
        # in
        f.is_valid?("53in").should be_false # too low
        f.is_valid?("54in").should be_true
        f.is_valid?("78in").should be_true
        f.is_valid?("79in").should be_false # too high

        # invalid input
        f.is_valid?("ain").should be_false
        f.is_valid?("a").should be_false
        f.is_valid?("").should be_false
    end
  end

end