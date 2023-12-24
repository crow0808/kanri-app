class CreateManuals < ActiveRecord::Migration[7.0]
  def change
    create_table :manuals do |t|
      t.references :user,    null: false, foreign_key: true
      t.references :room,    null: false, foreign_key: true
      t.string :manual_name, null: false
      t.string :model_number
      t.string :manual_url
      t.date :assurance
      t.date :manual_date
      t.integer :price
      t.text :manual_memo
      t.timestamps
    end
  end
end
