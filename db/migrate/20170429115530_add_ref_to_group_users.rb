class AddRefToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :group_users, :user, index: true, foreign_key: true
    add_reference :group_users, :group, index: true, foreign_key: true
  end
end
