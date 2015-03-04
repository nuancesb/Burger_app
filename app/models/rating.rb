class Rating < ActiveRecord::Base

  belongs_to :user
  belongs_to :burger

  validates :burger_id, :presence => true, :uniqueness => {:scope => :user_id,:message => "already rated by you"}
  end
 