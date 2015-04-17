module Autotest
  class TestCaseGenerator
    def initialize(break_points)
      @break_points = break_points
    end

    def test_values
      value_descriptions = []

      first = true
      input_cases.keys.each do |arg|
        if first
          value_descriptions = input_cases[arg].map do |constraint|
            [constraint]
          end
          first = false
          next
        end

        value_descriptions = value_descriptions.product(input_cases[arg])
      end

      value_descriptions.map do |description|
        _generate_concrete_values(description)
      end
    end

    def _generate_concrete_values(nested_list_description)
      total_description = nested_list_description.flatten
      concrete_values = {}
      until total_description.empty?
        single_arg_description = total_description.shift(3)
        concrete_values[single_arg_description.first] = _concrete_value(single_arg_description)
      end
      concrete_values
    end

    def _concrete_value(constraint)
      case constraint[1]
      when :== then constraint[2]
      when :neq then constraint[2] - 1
      end
    end

    def input_cases
      cases = {}
      @break_points.each do |break_point|
        arg = break_point.first
        cases[arg] = [] if cases[arg].nil?
        _input_cases_for(break_point).each do |kase|
          cases[arg] << kase
        end
      end
      cases
    end

    def _input_cases_for(break_point)
      first_arg, conditional, second_arg = break_point

      [
        break_point,
        [first_arg, _negation(conditional), second_arg],
      ]
    end

    def _negation(conditional)
      case conditional
      when :== then :neq
      end
    end
  end
end
