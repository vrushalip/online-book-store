class Product < ActiveRecord::Base
  has_many :images, as: :imageable
end
