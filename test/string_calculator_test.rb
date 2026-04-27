require "minitest/autorun"
require_relative "../lib/string_calculator"

class TestStringCalculator < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_returns_zero_for_empty_string
    result = @calculator.add("")
    assert_equal 0, result
  end

  def test_returns_number_for_single_number_string
    result = @calculator.add("6")
    assert_equal 6, result
  end

  def test_returns_for_comma_separated_number_string
    result = @calculator.add("1,2,3,4")
    assert_equal 10, result
  end

  def test_returns_for_new_line_between_numbers_string
    result = @calculator.add("1\n2,3")
    assert_equal 6, result
  end

  def test_returns_sum_for_custom_delimiter_string
    result = @calculator.add("//;\n1;2")
    assert_equal 3, result
  end
end
