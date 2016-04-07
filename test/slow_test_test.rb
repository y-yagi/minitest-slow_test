require 'minitest/autorun'

module MinitestSlowTestTest
  class ReportersTest < Minitest::Test
    attr_accessor :reporter, :output

    def setup
      @output = StringIO.new("")
      self.reporter = Minitest::CompositeReporter.new
      reporter << Minitest::SlowTest::Reporter.new(@output)
    end

    def test_slow_test_information_do_not_display
      reporter.start
      reporter.record(SampleTest.new(:test_normal).run)
      reporter.report
      assert_empty @output.string
    end

    def test_slow_test_information_display
      reporter.start
      reporter.record(SampleTest.new(:test_slow).run)
      reporter.report
      assert_match(/\[SlowTest\] SampleTest#test_slow/, @output.string)
    end

    def test_exclude_test_information_do_not_display
      Minitest::SlowTest.exclude_test_name = %(test_more_slow)
      reporter.start
      reporter.record(SampleTest.new(:test_slow).run)
      reporter.record(SampleTest.new(:test_more_slow).run)
      reporter.report
      assert_match(/\[SlowTest\] SampleTest#test_slow/, @output.string)
      refute_match(/\[SlowTest\] SampleTest#test_more_slow/, @output.string)
    end
  end
end

class SampleTest < Minitest::Test
  def test_normal
  end

  def test_slow
    sleep 1.0
  end

  def test_more_slow
    sleep 1.5
  end
end

