class CustomError < StandardError
end

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    raise ArgumentError unless first_operand.is_a? Integer
    raise ArgumentError unless second_operand.is_a? Integer
    raise CustomError.new('Division by zero is not allowed.') if second_operand == 0 && operation == '/'

    result = case operation
             when '+'
               first_operand + second_operand
             when '*'
               first_operand * second_operand
             when '/'
               first_operand / second_operand
             end
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  rescue CustomError => e
    e.message
  end
end
