class Breed < ActiveRecord::Base
  belongs_to :kind
  has_many :animals
end
