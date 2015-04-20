require "spec_helper"

describe Autotest::ConditionalGroup do
  describe "relevant_arguments" do
    it "is the set of arguments that show up in a conditional" do
      ast = RubyParser.new.parse(class_with_conditionals)
      processor = Autotest::ConditionalCountingProcessor.new(ast)
      group = Autotest::ConditionalGroup.new(processor.conditionals)

      args = group.relevant_arguments

      expect( args ).to eq [:arg1, :arg2, :arg3]
    end
  end

  describe "input_cases" do
    it "is a list of interesting break points in the conditionals" do
      ast = RubyParser.new.parse(class_with_conditionals)
      processor = Autotest::ConditionalCountingProcessor.new(ast)
      group = Autotest::ConditionalGroup.new(processor.conditionals)

      cases = group.input_cases

      expect( cases ).to include([:arg1, :==, 1])
    end
  end
end
