class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
      nums = numbers.split(/#{delimiter}|\n/).map(&:to_i)
    else
      nums = numbers.split(/,|\n/).map(&:to_i)
    end
    negatives = nums.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(", ")}" if negatives.any?
    nums.sum
  end
end
