class Animal < ActiveRecord::Base
  belongs_to :breed
  belongs_to :location
  has_many :posts
end
