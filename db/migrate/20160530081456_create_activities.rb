class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :target_id
      t.string :integer
      t.string :action_type
      t.string :integer
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
