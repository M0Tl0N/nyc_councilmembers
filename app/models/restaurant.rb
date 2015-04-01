class Restaurant < ActiveRecord::Base
  has_one :address
  has_many :reviews
end
