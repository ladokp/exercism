class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*']

  UnsupportedOperation = Class.new(StandardError)

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation.new unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless (first_operand.is_a?(Numeric) && second_operand.is_a?(Numeric))

    result = first_operand.public_send(operation, second_operand)

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end
end
