class User < ActiveRecord::Base
  include BCrypt

  has_many :addresses
  has_many :orders

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(value)
    @password = Password.create(value)
    self.password_hash = @password
  end

  def self.authentication(email, password)
    user = User.find_by(email: email)
    user if user && user.password == password
  end
end
