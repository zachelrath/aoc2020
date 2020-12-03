require "spec"
require "../src/passwordb"

describe PasswordB do
  describe "#is_valid?" do
    it "validates a password against its policy" do
        # char at index 1 IS an a, and char at index 3 is NOT
        PasswordB.is_valid?("1-3 a: abcde").should be_true
        # char at index 2 IS a c, and char at index 9 is as well
        PasswordB.is_valid?("2-9 c: ccccccccc").should be_false
        # NEITHER char at index 1 or index 3 IS a b
        PasswordB.is_valid?("1-3 b: cdefg").should be_false
    end
  end

end