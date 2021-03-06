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
          klass = slow_test.respond_to?(:klass) ? slow_test.klass : slow_test.class
          io.print "[SlowTest] %s#%s : %.2fs\n" % [klass, slow_test.name, slow_test.time]
        end
      end

      def record(result)
        if result.time.to_f > SlowTest.long_test_time && !SlowTest.exclude_test_name.include?(result.name.to_s)
          @slow_test_list << result
        end
      end

      # When using the following methods together with `minitest-reporters`,
      # they are required.
      def add_defaults(defaults); end

      def before_test(test); end

      def after_test(test); end
    end
  end
end
