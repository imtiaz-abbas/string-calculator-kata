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

  def test_raises_exception_for_negative_number
    error = assert_raises(RuntimeError) { @calculator.add("-1,2") }
    assert_equal "negatives not allowed: -1", error.message
  end

  def test_numbers_bigger_than_1000_are_ignored
    result = @calculator.add("2,1001")
    assert_equal 2, result
  end

  def test_returns_sum_for_multi_char_custom_delimiter
    result = @calculator.add("//[***]\n1***2***3")
    assert_equal 6, result
  end

  def test_returns_sum_for_multiple_delimiters
    result = @calculator.add("//[*][%]\n1*2%3")
    assert_equal 6, result
  end

  def test_returns_sum_for_multiple_long_delimiters
    result = @calculator.add("//[***][%%]\n1***2%%3")
    assert_equal 6, result
  end
end
