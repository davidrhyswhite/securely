require 'test_helper'

class SecurelyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Securely::VERSION
  end

  def test_it_does_something_useful
    assert_equal 'test passes', Securely.generate_password
  end
end
