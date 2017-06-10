class CreateAnimator < ActiveRecord::Migration
  def change
    create_table :animators do |t|
      t.string :first_name
    end
  end
end
