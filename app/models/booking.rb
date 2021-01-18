class Booking < ApplicationRecord
    has_many :bookitems
  belongs_to :user
end
