class Restaurant < ActiveRecord::Base

  has_many :burgers
  belongs_to :user
  geocoded_by :postcode

  after_create :geocode
  after_validation :geocode, :if => :postcode_changed?
end
