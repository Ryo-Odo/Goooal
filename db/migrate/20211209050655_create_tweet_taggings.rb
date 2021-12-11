class CreateTweetTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_taggings do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :tweet_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
