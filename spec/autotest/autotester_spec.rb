require "spec_helper"

describe Autotest do
  it "can check the entire state space of a function" do
    ast = RubyParser.new.parse(class_with_conditionals)
    processor = Autotest::ConditionalCountingProcessor.new(ast)
    group = Autotest::ConditionalGroup.new(processor.conditionals)
    generator = Autotest::TestCaseGenerator.new(group.input_cases)

    eval(class_with_conditionals)
    object_under_test = ClassWithConditionals.new

    generator.test_values.each do |v|
      result = object_under_test.test_method(v[:arg1], v[:arg2], v[:arg3])
      expect( result ).to_not eq 4
    end
  end
end
