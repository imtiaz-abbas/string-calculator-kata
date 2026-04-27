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

- [ ] Empty string returns 0
- [ ] Single number returns that number
- [ ] Two numbers return their sum
- [ ] Handle any amount of numbers
- [ ] Handle newlines between numbers
- [ ] Support custom delimiters
- [ ] Throw exception for negative numbers

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
