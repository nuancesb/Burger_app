class Burger < ActiveRecord::Base
  belongs_to :restaurant
  has_many :ratings
  
  mount_uploader :profile_picture, ImageUploader



end
