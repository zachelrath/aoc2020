require "spec"
require "../enum_field"

describe EnumField do
  describe "#is_valid?" do
    it "validates inputs against a EnumField schema" do
        f = EnumField.new("ss", Set{"foo","bar"})
        # super should be called
        f.name.should eq "ss"
        f.is_valid?("zaa").should be_false
        f.is_valid?("foo").should be_true
        f.is_valid?("bar").should be_true
    end
  end

end