require "securely/version"

module Securely

  UPPERCASE = ('A'..'Z').to_a
  LOWERCASE = ('a'..'z').to_a
  NUMBERS   = (0..9).to_a
  SPECIALS  = %w(! $ % & * @ ^)

  def self.generate_password(length: 32, uppercase: true, lowercase: true, numbers: true, specials: true)
    'test passes'
  end
end
