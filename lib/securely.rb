require "securely/version"

module Securely

  UPPERCASE = ('A'..'Z').to_a
  LOWERCASE = ('a'..'z').to_a
  NUMBERS   = (0..9).to_a
  SPECIALS  = %w(! $ % & * @ ^)

  def self.generate_password(length: 32, uppercase: true, lowercase: true, numbers: true, specials: true)
    raise 'Invalid option password length must be greater than zero' if length < 1

    characters = self.provide_characters(uppercase, lowercase, numbers, specials)

    (0...length).collect { characters.sample }.join
  end

  private

  def self.provide_characters(uppercase, lowercase, numbers, specials)
    raise 'Invalid options provided one of uppercase, lowercase, numbers or specials must be true' unless uppercase || lowercase || numbers || specials
    characters = []
    characters << UPPERCASE if uppercase
    characters << LOWERCASE if lowercase
    characters << NUMBERS if numbers
    characters << SPECIALS if specials

    characters.flatten!
  end
end
