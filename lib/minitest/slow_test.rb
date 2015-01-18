require 'minitest/slow_test/version'

module Minitest
  module SlowTest
    class << self
      attr_writer :long_test_time

      def long_test_time
        unless defined? @long_test_time
          @long_test_time = 1.0
        end
        @long_test_time.to_f
      end
    end
  end
end
