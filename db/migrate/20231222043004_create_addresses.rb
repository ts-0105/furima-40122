class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :post_num,    null: false
      t.integer    :region_id,   null: false
      t.string     :city,        null: false
      t.string     :street,      null: false
      t.string     :building
      t.string     :phone_num,   null: false
      t.references :bought,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
