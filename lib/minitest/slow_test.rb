require 'minitest/slow_test/version'

module Minitest
  module SlowTest
    class << self
      attr_writer :long_test_time
      attr_writer :exclude_test_name

      def long_test_time
        unless defined? @long_test_time
          @long_test_time = 1.0
        end
        @long_test_time.to_f
      end

      def exclude_test_name
        unless defined? @exclude_test_name
          @exclude_test_name = []
        end
        @exclude_test_name
      end
    end
  end
end
