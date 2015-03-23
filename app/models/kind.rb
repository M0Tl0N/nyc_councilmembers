class Kind < ActiveRecord::Base
  has_many :breeds
  has_many :animals, through: :breeds
end
