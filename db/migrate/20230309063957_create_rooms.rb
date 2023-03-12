class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :detail
      t.integer :price
      t.text :address

      t.timestamps
    end
  end
end
