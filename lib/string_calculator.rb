class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    nums = parse(numbers)
    validate_no_negatives(nums)
    nums.sum
  end

  private

  def parse(numbers)
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
      numbers.split(/#{delimiter}|\n/).map(&:to_i)
    else
      numbers.split(/,|\n/).map(&:to_i)
    end
  end

  def validate_no_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(", ")}" if negatives.any?
  end
end
