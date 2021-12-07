class CreateGoalTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :goal_taggings do |t|
      t.references :goal, null: false, foreign_key: true
      t.references :goal_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
