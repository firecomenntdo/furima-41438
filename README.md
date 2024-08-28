## userテーブル

 | Columm               |  Type  | Options                 |
 | -------------------- |  ----  | ----------------------- |
 | nickname             | string | null: false             |
 | email                | string |null: false,unique: true |
 | encrypted_password   | string |null: false,unique: true |
 | lastname             | string | null: false             |
 | firstname            | string | null: false             |
 | lastname-kana        | string | null: false             |
 | firstname-kana       | string | null: false             |
 | birthyear            | integer | null: false             |
 | birthmonth           | integer | null: false             |
 | birthdate            | integer | null: false             |

 ### Association
 - has_many :itempurcheses
 - has_many :items

## itemテーブル

 | Columm               |  Type  | Options                 |
 | -------------------- |  ----  | ----------------------- |
 | title                | string | null: false             |
 | context              | text   | null: false             |
 | category             | integer | null: false             |
 | itemstatus           | integer | null: false             |
 | shipping             | integer | null: false             |
 | sellerprefecture     | integer | null: false             |
 | shippingdate         | integer | null: false             |
 | price                | integer | null: false             |
 
### Association
- belongs_to :user
- belongs_to ::itempurchese

## itempurcheseテーブル

 | Columm               |  Type  | Options                 |
 | -------------------- |  ----  | ----------------------- |
 | addressnumber        | string | null: false             |
 | purcheseprefecture   | integer | null: false             |
 | address              | string | null: false             |
 | blocknumber          | string | null: false             |
 | buildingname         | string |                         |
 | phonenumber          | string | null: false             |

 ### Association
 - belongs_to :user
 - belongs_to :item