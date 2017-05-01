class RemoveUserIdIdFromGroupUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :group_users, :user_id_id, :integer
  end
end
