class Burger < ActiveRecord::Base
  belongs_to :restaurant
  has_many :ratings
  belongs_to :user
  mount_uploader :profile_picture, ImageUploader



end
