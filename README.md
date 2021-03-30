# テーブル設計


## users テーブル

| Column          | Type   | Options                   |
| ---------       | ------ | -----------               |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birthday        | integer| null: false               |

### Association

- has_many : items
- has_many : orders



## items テーブル

| Column          | Type      | Options           |              
| ---------       | ------    | -----------       |              
| name            | string    | null: false       |
| information     | text      | null: false       |              
| category        | text      | null: false       |              
| status          | text      | null: false       |              
| delivery_price  | integer   | null: false       |              
| delivery_days   | integer   | null: false       |               
| item_price      | integer   | null: false       |             
| user            | references| foreign_key: true |

### Association

- belongs_to : user
- has_one    : order



## addresses テーブル

| Column          | Type      | Options           |              
| ---------       | ------    | -----------       |              
| postal_code     | integer   | null: false       |
| prefectures     | string    | null: false       |              
| municipality    | string    | null: false       |              
| house_number    | integer   | null: false       |              
| phone_number    | integer   | null: false       |                          
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