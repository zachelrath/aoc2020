require "spec"
require "../regex_field"

describe RegexField do
  describe "#is_valid?" do
    it "validates inputs against a RegexField schema" do
        f = RegexField.new("bd", /^[a-z]{2,3}$/)
        # super should be called
        f.name.should eq "bd"
        f.is_valid?("111").should be_false
        f.is_valid?("a").should be_false
        f.is_valid?("aaaa").should be_false
        f.is_valid?("1ab3c").should be_false
        f.is_valid?("abc").should be_true
        f.is_valid?("zzz").should be_true
    end
  end

end