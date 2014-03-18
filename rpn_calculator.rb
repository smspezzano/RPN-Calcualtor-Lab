require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    @new_stack = Stack.new
    rpn_string.split.each {|item| @new_stack.push(item) }
  end

  def self.evaluate(rpn_list)
    index = 0
    stack = Stack.new

    while index < rpn_list.length
      item = rpn_list[index]

      if RPNCalculator.is_number item
        stack.push item.to_f
      elsif RPNCalculator.is_operation item
        right_num = stack.pop
        left_num = stack.pop

        unless left_num.is_a? Numeric and right_num.is_a? Numeric
          raise ArgumentError
        end

        if item == '^'
          val = left_num.public_send :**, right_num
        else
          val = left_num.public_send item.to_sym, right_num
        end
        stack.push val
      end

      index += 1
    end

    ret_val = stack.pop

    ret_val
  end

  def self.is_operation(operation)
    if /^[\^*+-\/]$/.match(operation) != nil
      true
    else
      false
    end
  end
  
  def self.is_number(num)
    # /^[+-]?([\d])+[.]?[\d]*$/.match(num) != nil ? true : false

    if /^[0-9]+$/.match(num) != nil
      true
    else
      false
    end
  end
end
