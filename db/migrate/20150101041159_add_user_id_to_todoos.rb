class AddUserIdToTodoos < ActiveRecord::Migration
  def change
    add_column :todoos, :user_id, :integer
  end
end
