class Farmer < ActiveRecord::Base
  include BCrypt
  has_many :pigs

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password #sets the 'password hash' attribute to the encrypted password that was made using Password.create
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def self.authenticate(params)
    farmer = Farmer.find_by(email: params[:email])
    farmer if farmer && farmer.password == params[:password]
  end

end
