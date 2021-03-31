# テーブル設計


## users テーブル

| Column            | Type   | Options                   |
| ---------         | ------ | -----------               |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| last_name         | string | null: false               |
| first_name        | string | null: false               |
| last_name_kana    | string | null: false               |
| first_name_kana   | string | null: false               |
| birthday          | date   | null: false               |

### Association

- has_many : items
- has_many : orders



## items テーブル

| Column            | Type      | Options           |              
| ---------         | ------    | -----------       |              
| name              | string    | null: false       |
| information       | text      | null: false       |              
| category_id       | integer   | null: false       |              
| status_id         | integer   | null: false       | 
| prefectures_id    | integer   | null: false       |                
| delivery_price_id | integer   | null: false       |              
| delivery_days_id  | integer   | null: false       |               
| item_price        | integer   | null: false       |             
| user              | references| foreign_key: true |

### Association

- belongs_to : user
- has_one    : order



## addresses テーブル

| Column          | Type      | Options           |              
| ---------       | ------    | -----------       |              
| postal_code     | string    | null: false       |
| prefectures_id  | integer   | null: false       |              
| municipality    | string    | null: false       |              
| house_number    | integer   | null: false       |
| building        | string    |                   |              
| phone_number    | string    | null: false       |                          
| order           | references| foreign_key: true |

### Association

- belongs_to : order



##  orders テーブル

| Column          | Type      | Options           |              
| ---------       | ------    | -----------       |                          
| user            | references| foreign_key: true |
| item            | references| foreign_key: true |
              
### Association

- belongs_to : user
- belongs_to : item
- has_one    : address