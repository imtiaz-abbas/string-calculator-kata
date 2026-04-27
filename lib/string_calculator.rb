class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
      return numbers.split(/#{delimiter}|\n/).map(&:to_i).sum
    else
      return numbers.split(/,|\n/).map(&:to_i).sum
    end
  end
end
