require "spec_helper"

describe Autotest::TestCaseGenerator do
  describe "test_values" do
    it "generates the cross product of all input cases" do
      ast = RubyParser.new.parse(class_with_conditionals)
      processor = Autotest::ConditionalCountingProcessor.new(ast)
      group = Autotest::ConditionalGroup.new(processor.conditionals)
      generator = Autotest::TestCaseGenerator.new(group.input_cases)

      expect( generator.test_values.count ).to eq 16
    end
  end

  describe "input_cases" do
    it "is an mapping of values for each variable" do
      ast = RubyParser.new.parse(class_with_conditionals)
      processor = Autotest::ConditionalCountingProcessor.new(ast)
      group = Autotest::ConditionalGroup.new(processor.conditionals)
      generator = Autotest::TestCaseGenerator.new(group.input_cases)

      expect( generator.input_cases[:arg1] ).to eq [[:arg1, :==, 1], [:arg1, :neq, 1], [:arg1, :==, 2], [:arg1, :neq, 2]]
      expect( generator.input_cases[:arg2] ).to eq [[:arg2, :==, 2], [:arg2, :neq, 2]]
      expect( generator.input_cases[:arg3] ).to eq [[:arg3, :==, 5], [:arg3, :neq, 5]]
    end
  end
end
