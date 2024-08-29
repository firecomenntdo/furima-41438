## usersテーブル

 | Columm               |  Type  | Options                 |
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
 - has_many :item_purcheses
 - has_many :items, foreign_key: true

## itemsテーブル

 | Columm               |  Type  | Options                 |
 | -------------------- |  ----  | ----------------------- |
 | title                | string | null: false             |
 | context              | text   | null: false             |
 | category_id          | integer | null: false             |
 | item_status_id        | integer | null: false             |
 | shipping_id          | integer | null: false             |
 | seller_prefecture_id  | integer | null: false             |
 | shipping_date_id      | integer | null: false             |
 | price                | integer | null: false             |
 
### Association
- belongs_to :user
- belongs_to :item_purchese

## item_purchesesテーブル

 | Columm               |  Type  | Options                 |
 | -------------------- |  ----  | ----------------------- |
 | address_number       | string | null: false             |
 | purchese_prefecture_id| integer | null: false             |
 | address              | string | null: false             |
 | block_number          | string | null: false             |
 | building_name         | string |                         |
 | phone_number          | string | null: false             |

 ### Association
 - belongs_to :user
 - belongs_to :item

## purchese_histories

 | Columm               |  Type      | Options                       |
 | -------------------- |  ----      | ----------------------------- |
 | user                 | references | foreign_key: true             |
 | item                 | references | foreign_key: true             |

 ### Association
 - has_many :users
 - has_many :items