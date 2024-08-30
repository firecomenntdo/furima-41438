## usersテーブル

 | Column               |  Type  | Options                 |
 | -------------------- |  ----  | ----------------------- |
 | nickname             | string | null: false             |
 | email                | string |null: false,unique: true |
 | encrypted_password   | string |null: false              |
 | lastname             | string | null: false             |
 | firstname            | string | null: false             |
 | lastname_kana        | string | null: false             |
 | firstname_kana       | string | null: false             |
 | birth                | date   | null: false             |


 ### Association
 - has_one :purchase_history
 - has_many :items

## itemsテーブル

 | Column               |  Type  | Options                 |
 | -------------------- |  ----  | ----------------------- |
 | title                | string | null: false             |
 | context              | text   | null: false             |
 | category_id          | integer | null: false             |
 | item_status_id       | integer | null: false             |
 | shipping_id          | integer | null: false             |
 | prefecture_id        | integer | null: false             |
 | shipping_date_id     | integer | null: false             |
 | price                | integer | null: false             |
 | user                 | references | null: false, foreign_key: true    |
 
### Association
- belongs_to :user
- has_one :purchase_history

## item_purchasesテーブル

 | Column               |  Type  | Options                 |
 | -------------------- |  ----  | ----------------------- |
 | address_number       | string | null: false             |
 | prefecture_id        | integer | null: false            |
 | address              | string | null: false             |
 | block_number         | string | null: false             |
 | building_name        | string |                         |
 | phone_number         | string | null: false             |
 | purchase_history     | references | null: false, foreign_key: true   |


 ### Association
 - belongs_to :purchese_historie

## purchase_histories

 | Column               |  Type      | Options                       |
 | -------------------- |  ----      | ----------------------------- |
 | user                 | references | null: false, foreign_key: true             |
 | item                 | references | null: false, foreign_key: true             |
 
 ### Association
 - belongs_to :user
 - belongs_to :item
 - has_one :item_purchase