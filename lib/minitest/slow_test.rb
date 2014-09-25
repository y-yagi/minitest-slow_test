require 'minitest/slow_test/version'

module Minitest
  module SlowTest
    class << self
      attr_accessor :long_test_time

      def long_test_time
        (@long_test_time || 1.0).to_f
      end
    end
  end
end
