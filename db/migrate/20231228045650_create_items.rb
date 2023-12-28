class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :room,     null: false, foreign_key: true
      t.string :item_name,    null: false
      t.text :item_memo
      t.timestamps
    end
  end
end
