class ChangeNameOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :name, false
  end
end
