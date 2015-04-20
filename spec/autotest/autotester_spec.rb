require "spec_helper"

describe Autotest::Autotester do
  let(:my_method) do
      str = <<RUBY
def my_method(arg1, arg2)
  if arg1 == 2
    :arg1
  elsif arg2 == 3
    :arg2
  end
end
RUBY
  end

  describe "cases" do
    it "generates a list of test cases for a string of ruby" do
      tester = Autotest::Autotester.new(my_method)

      expect( tester.cases ).to eq [
        {:arg1=>2, :arg2=>3},
        {:arg1=>2, :arg2=>2},
        {:arg1=>1, :arg2=>3},
        {:arg1=>1, :arg2=>2},
      ]
    end
  end
end
