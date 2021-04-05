class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,null: false 
      t.text :information,null: false 
      t.integer :category_id,null: false 
      t.integer  :status_id,null: false 
      t.integer  :prefecture_id,null: false 
      t.integer  :delivery_price_id,null: false 
      t.integer  :delivery_day_id,null: false 
      t.integer  :item_price,null: false 
      t.references :user ,foreign_key: true
      t.timestamps
    end
  end
end


| name              | string    | null: false       |
| information       | text      | null: false       |              
| category_id       | integer   | null: false       |              
| status_id         | integer   | null: false       | 
| prefecture_id     | integer   | null: false       |                
| delivery_price_id | integer   | null: false       |              
| delivery_day_id   | integer   | null: false       |               
| item_price        | integer   | null: false       |             
| user              | references| foreign_key: true |
