class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text
      t.integer :twitteruser_id
      t.timestamps
    end
  end
end
