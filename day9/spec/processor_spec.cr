require "spec"
require "../processor"

describe Processor do
  describe "#part1" do
    it "finds first target value and idx where some permutation of previous look_behind inputs sums to target" do
        look_behind = 5
        raw_input = [35,20,15,25,47,40,62,55,65,95,102,117,150,182,127,219,299,277,309,576]
        parts = Processor.part1(look_behind, raw_input.map { |x| x.to_i64 })
        parts[0].should eq 127
        parts[1].should eq 14
    end
  end

end