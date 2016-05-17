require 'test_helper'

class SecurelyTest < Minitest::Test

  def setup
    @lowercase = 'a-z'
    @uppercase = 'A-Z'
    @numerical = '0-9'
    @specials = '!$%&*@^'
  end

  def test_that_it_has_a_version_number
    refute_nil ::Securely::VERSION
  end

  def test_default_password_length_is_32
    password = Securely.generate_password
    assert_equal 32, password.length
  end

  def test_password_lenth_can_be_set
    password = Securely.generate_password length: 26
    assert_equal 26, password.length
  end

  def test_it_generates_lowercase_characters
    password = Securely.generate_password lowercase: true, uppercase: false, numbers: false, specials: false
    assert_match /[#{@lowercase}]/, password
    refute_match /[#{ @uppercase + @numerical + @specials }]/, password
  end

  def test_it_generates_uppercase_characters
    password = Securely.generate_password lowercase: false, uppercase: true, numbers: false, specials: false
    assert_match /[#{@uppercase}]/, password
    refute_match /[#{ @lowercase + @numerical + @specials }]/, password
  end

  def test_it_generates_numerical_characters
    password = Securely.generate_password lowercase: false, uppercase: false, numbers: true, specials: false
    assert_match /[#{@numerical}]/, password
    refute_match /[#{ @lowercase + @uppercase + @specials }]/, password
  end

  def test_it_generates_special_characters
    password = Securely.generate_password lowercase: false, uppercase: false, numbers: false, specials: true
    assert_match /[#{@specials}]/, password
    refute_match /[#{ @lowercase + @uppercase + @numerical }]/, password
  end

  def test_an_error_is_raised_if_characters_are_empty
    assert_raises { Securely.generate_password lowercase: false, uppercase: false, numbers: false, specials: false }
  end

  def test_error_message_is_provided_if_characters_are_empty
    exception = assert_raises { Securely.generate_password lowercase: false, uppercase: false, numbers: false, specials: false }
    expected = 'Invalid options provided one of uppercase, lowercase, numbers or specials must be true'

    assert_equal expected, exception.message
  end

  def test_an_error_is_raised_if_length_is_less_than_one
    assert_raises { Securely.generate_password length: -4 }
  end

  def test_error_message_is_provided_if_length_is_less_than_one
    exception = assert_raises { Securely.generate_password length: -4 }
    expected = 'Invalid option password length must be greater than zero'

    assert_equal expected, exception.message
  end
end
