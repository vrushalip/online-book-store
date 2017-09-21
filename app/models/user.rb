class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable, :registerable

  ## Associations
  has_many :cart_items, as: :itemable, class_name: 'Item'
  has_many :orders
end
