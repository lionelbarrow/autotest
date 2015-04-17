require "rspec"
require_relative "../lib/autotest"

def class_with_conditionals
<<-RUBY
  class ClassWithConditionals
    def test_method(arg1, arg2, arg3)
      if arg1 == 1
        1
      elsif arg2 == 2
        if arg1 == 2
          4
        elsif arg3 == 5
          2
        end
      else
        3
      end
    end
  end
RUBY
end
