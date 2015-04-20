module Autotest
  class Autotester
    def initialize(source)
      @source = source
    end

    def cases
      ast = RubyParser.new.parse(@source)
      processor = ConditionalProcessor.new(ast)
      group = ConditionalGroup.new(processor.conditionals)
      generator = TestCaseGenerator.new(group.constraints)
      generator.test_values
    end
  end
end
