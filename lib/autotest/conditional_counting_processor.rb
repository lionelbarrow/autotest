module Autotest
  class ConditionalCountingProcessor < SexpProcessor
    attr_reader :count, :conditionals

    def initialize(exp)
      @count = 0
      @conditionals = []

      super()

      process(exp)
    end

    def process_if(exp)
      @count += 1

      exp.shift
      branching_exp = exp.shift
      # If there are further conditionals within this exp
      # we will miss them. TODO: Fix.
      @conditionals << branching_exp

      until exp.empty? do
        process(exp.shift)
      end

      s
    end
  end
end
