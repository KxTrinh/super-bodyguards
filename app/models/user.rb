class User < ApplicationRecord
  has_many :bookings
  has_many :heros

  validates :name, presence: true
end
