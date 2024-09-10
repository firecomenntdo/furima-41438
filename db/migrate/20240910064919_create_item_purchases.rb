class CreateItemPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :item_purchases do |t|

      t.timestamps
    end
  end
end
