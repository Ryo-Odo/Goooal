class CreateTweetTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_tags do |t|
      t.string :tweet_tag_name,  null: false, limit: 15
      t.timestamps
    end
  end
end
