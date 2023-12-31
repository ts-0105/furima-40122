class BoughtAddress
  include ActiveModel::Model
  attr_accessor :post_num, :region_id, :city, :street, :building, :phone_num, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :region_id, :city, :street, :phone_num, :user_id, :item_id, :token
    validates :post_num, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :phone_num, format: { with: /\A\d{10,11}\z/ }

  def save
    # 各テーブルにデータを保存する処理を書く
    # boughtテーブルに保存
    bought = Bought.create(user_id:, item_id:)
    # addressテーブルに保存
    Address.create(post_num:, region_id:, city:, street:, building:,
                   phone_num:, bought_id: bought.id)
  end
end
