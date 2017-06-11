class AddUserIdToAnimators < ActiveRecord::Migration
  def change
    add_column :animators, :user_id, :integer
  end
end
