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
end
