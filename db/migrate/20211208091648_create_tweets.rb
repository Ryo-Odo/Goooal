class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.references :goal, null: false, foreign_key: true

      t.string :content, null: false, limit: 140

      t.timestamps
    end
  end
end
