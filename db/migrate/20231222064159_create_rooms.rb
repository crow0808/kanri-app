class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_name,     null: false
      t.string :room_password, null: false
      t.timestamps
    end
  end
end
