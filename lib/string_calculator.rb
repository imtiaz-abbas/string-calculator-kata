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
      header, numbers = numbers[2..].split("\n", 2)
      delimiters = header.start_with?("[") ? header.scan(/\[(.+?)\]/).flatten : [header]
      pattern = delimiters.map { |d| Regexp.escape(d) }.join("|")
      numbers.split(/#{pattern}/).map(&:to_i).reject { |n| n > 1000 }
    else
      numbers.split(/,|\n/).map(&:to_i).reject { |n| n > 1000 }
    end
  end

  def validate_no_negatives(nums)
    negatives = nums.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(", ")}" if negatives.any?
  end
end
