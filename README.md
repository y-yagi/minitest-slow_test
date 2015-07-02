# Minitest::SlowTest

Display the summary of a slow test when tests finished.

[![Build Status](https://travis-ci.org/y-yagi/minitest-slow_test.svg?branch=master)](https://travis-ci.org/y-yagi/minitest-slow_test)
[![Gem Version](https://badge.fury.io/rb/minitest-slow_test.svg)](http://badge.fury.io/rb/minitest-slow_test)


## Output example

```shell
$ ./bin/rake test
Run options: --seed 4004

# Running:

........................

Finished in 3.367417s, 7.1271 runs/s, 16.0360 assertions/s.

24 runs, 54 assertions, 0 failures, 0 errors, 0 skips
[SlowTest]PageIntegrationTest#test_create_new_page : 1.17s
[SlowTest]PageTest#test_do_not_find_page_when_use_invalid_title : 1.00s
```

## Installation

Add this line to your application's Gemfile:

    gem 'minitest-slow_test'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-slow_test

## Usage

Such a test is output more than one second, and processing makes by default it.

When You want to change the processing time, please set it as follows in `test_helper.rb`

```ruby
require 'minitest/slow_test'

Minitest::SlowTest.long_test_time = 0.5  # specified in seconds
```

If there is a test that you do not want to display even if slow, use the `exclude` options.

```ruby
Minitest::SlowTest.exclude_test_name = %(test_do_not_display)  # specify the test name in the Array of String
```

### When use with `minitest-reporters`

When use it with `minitest-reporters`, it is necessary to set `Minitest::SlowTest::Reporter` in `Minitest::Reporters.use!`

Example:

```ruby
require 'minitest/slow_test/reporter'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new, Minitest::SlowTest::Reporter.new]
```

## Contributing

1. Fork it ( https://github.com/y-yagi/minitest-slow_test/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
