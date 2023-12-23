class Address < ApplicationRecord
  attr_accessor :token
  belongs_to :bought
  validates :token, presence: true
end
