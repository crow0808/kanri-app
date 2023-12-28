class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :room,     null: false, foreign_key: true
      t.string :book_name,    null: false
      t.integer :book_number, null: false
      t.date :release_date
      t.text :book_memo
      t.timestamps
    end
  end
end
