require_relative '../lib/rctp'
gem              'minitest'
require          'minitest/autorun'
require          'minitest_visible'

class RctpTest < Minitest::Test

  #Track mini-test progress.
  include MinitestVisible

  def test_that_it_has_a_version_number
    refute_nil ::Rctp::VERSION
    assert(::Rctp::VERSION.is_a?(String))
    assert(/\A\d+\.\d+\.\d+/ =~ ::Rctp::VERSION)
  end

end
