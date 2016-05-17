require "securely/version"

module Securely

  UPPERCASE = ('A'..'Z').to_a
  LOWERCASE = ('a'..'z').to_a
  NUMBERS   = (0..9).to_a
  SPECIALS  = %w(! $ % & * @ ^)

  def self.generate_password(length: 32, uppercase: true, lowercase: true, numbers: true, specials: true)
    characters = self.provide_characters(uppercase, lowercase, numbers, specials)

    (0...length).collect { characters.sample }.join
  end

  private

  def self.provide_characters(uppercase, lowercase, numbers, specials)
    characters = []
    characters << UPPERCASE if uppercase
    characters << LOWERCASE if lowercase
    characters << NUMBERS if numbers
    characters << SPECIALS if specials

    characters.flatten!
  end
end
