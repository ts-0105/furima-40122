class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :load
  belongs_to :region

  has_one_attached :image
  has_one :bought
  belongs_to :user

  validates :name, :text, :image, :category_id, :condition_id, :load_id, :region_id, :delivery_date_id, :price, presence: true
  validates :category_id, :condition_id, :load_id, :region_id, :delivery_date_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
end
