require "spec_helper"

describe Autotest::ConditionalCountingProcessor do
  describe "process" do
    it "counts conditionals in an AST" do
      ast = RubyParser.new.parse(class_with_conditionals)
      processor = Autotest::ConditionalCountingProcessor.new(ast)

      expect( processor.count ).to eq 3
    end

    it "keeps track of the s-expressions the code branches on" do
      ast = RubyParser.new.parse(class_with_conditionals)
      processor = Autotest::ConditionalCountingProcessor.new(ast)

      expect( processor.conditionals ).to eq [
        s(:call, s(:lvar, :arg1), :==, s(:lit, 1)),
        s(:call, s(:lvar, :arg2), :==, s(:lit, 2)),
        s(:call, s(:lvar, :arg1), :==, s(:lit, 2)),
      ]
    end
  end
end
