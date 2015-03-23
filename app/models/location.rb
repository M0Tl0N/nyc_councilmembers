class Location < ActiveRecord::Base
  has_many :animals
  has_many :posts, through: :animals
end
