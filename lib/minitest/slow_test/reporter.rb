module Minitest
  module SlowTest
    class Reporter < StatisticsReporter
      attr_reader :slow_test_list

      def initialize(io = $stdout, options = {})
        super(io, options)
        @slow_test_list = []
      end

      def report
        super
        @slow_test_list.each do |slow_test|
          io.print "[SlowTest] %s#%s : %.2fs\n" % [slow_test.class, slow_test.name, slow_test.time]
        end
      end

      def record(result)
        @slow_test_list << result if result.time.to_f > SlowTest.long_test_time
      end

      # When using the following methods together with `minitest-reporters`,
      # they are required.
      def add_defaults(defaults); end

      def before_test(test); end

      def after_test(test); end
    end
  end
end
