require 'minitest/slow_test'
require 'minitest/slow_test/reporter'

module Minitest
  def self.plugin_slow_test_init(opts)
    self.reporter << Minitest::SlowTest::Reporter.new
  end
end
