class CreateGoalTags < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_tags do |t|
      t.string :goal_tag_name,  null: false, limit: 15
      t.timestamps
    end
  end
end
