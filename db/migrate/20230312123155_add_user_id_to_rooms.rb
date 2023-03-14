class AddUserIdToRoom < ActiveRecord::Migration[6.1]
  def change
    add_column :room, :user_id, :integer
  end
end
