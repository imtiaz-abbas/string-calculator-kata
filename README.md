# String Calculator TDD Kata

This is an implementation of the String Calculator TDD in Ruby using Minitest.

## Getting Started

### Prerequisites

- Ruby 3.2.1 (managed via rbenv/rvm - see `.ruby-version`)
- Bundler gem

### Setup

```bash
# Using rbenv
rbenv install 3.2.1
rbenv local 3.2.1

# Using rvm
rvm install 3.2.1
rvm use 3.2.1

# Install dependencies
bundle install
```

### Running Tests

```bash
ruby test/string_calculator_test.rb
```

## TDD Progress

Following the TDD Red-Green-Refactor cycle for each requirement:

- [x] Empty string returns 0
- [x] Single number returns that number
- [x] Two or more comma-separated numbers return their sum
- [x] Handle newlines between numbers as a delimiter
- [x] Support custom single-character delimiter (`//;\n1;2` returns 3)
- [x] Throw exception for negative numbers — message includes the negative value(s)
- [x] Numbers greater than 1000 are ignored (`2 + 1001 = 2`)
- [x] Custom delimiter can be any length (`//[***]\n1***2***3` returns 6)
- [x] Multiple delimiters supported (`//[*][%]\n1*2%3` returns 6)
- [x] Multiple delimiters can each be longer than one character (`//[***][%%]\n1***2%%3` returns 6)

## Project Structure

```
string-calculator/
|-- lib/
│   |-- string_calculator.rb    # Main implementation
|-- test/
│   |-- string_calculator_test.rb  # Test cases
|-- README.md
```

|
|
No newline at end of file
