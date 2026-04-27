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

end
