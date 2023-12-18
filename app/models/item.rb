class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_date
  belongs_to :load
  belongs_to :region

  belongs_to :user
  has_one_attached :image

  validates :name, :text, :image, :category_id, :condition_id, :load_id, :region_id, :delivery_date_id, :price, presence: true
  validates :category_id, :condition_id, :load_id, :region_id, :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
