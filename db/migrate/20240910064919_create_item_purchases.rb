class CreateItemPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :item_purchases do |t|
      t.string :address_number, null: false
      t.integer :prefecture_id, null: false
      t.string :address, null: false
      t.string :block_number, null: false
      t.string :building_name
      t.references :purchase_history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
