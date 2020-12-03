require "spec"
require "../src/password"

describe Password do
  describe "#is_valid?" do
    it "validates a password against its policy" do
        Password.is_valid?("1-3 a: abcde").should be_true
        Password.is_valid?("2-9 c: ccccccccc").should be_true
        Password.is_valid?("1-3 b: cdefg").should be_false
    end
  end

end