class Shout < ApplicationRecord
  belongs_to :user
  validates :message, :presence => true, :length => { :in => 1..200 }
  validates :user_id, :presence => true
end
