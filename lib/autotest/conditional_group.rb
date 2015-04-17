module Autotest
  class ConditionalGroup
    def initialize(conditionals)
      @conditionals = conditionals
    end

    def relevant_arguments
      all_args = @conditionals.map do |sexp|
        lvars = []
        sexp.each_of_type(:lvar) do |inner_sexp|
          lvars << inner_sexp.sexp_body.first
        end
        lvars
      end

      all_args.flatten.uniq
    end

    def input_cases
      cases = []
      @conditionals.each do |sexp|
        relevant_arguments.each do |arg|
          body = sexp.sexp_body
          if body.first.sexp_body.first == arg
            cases << [
              body[0].sexp_body.first,
              body[1],
              body[2].sexp_body.first,
            ]
          end
        end
      end
      cases
    end
  end
end
