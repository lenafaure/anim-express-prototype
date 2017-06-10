class AddLastNameToAnimators < ActiveRecord::Migration
  def change
    add_column :animators, :last_name, :string
    add_column :animators, :created_at, :datetime
    add_column :animators, :updated_at, :datetime
  end
end
