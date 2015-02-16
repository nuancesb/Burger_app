class Restaurant < ActiveRecord::Base

has_many :burgers
geocoded_by :postcode
  after_validation :geocode, :if => :postcode_changed?
end
