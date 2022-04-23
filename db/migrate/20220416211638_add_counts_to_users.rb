class AddCountsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :following_count, :integer, default: 0
    add_column :users, :followed_count, :integer, default: 0
    add_column :users, :likes_count, :integer, default: 0
    add_column :users, :tweets_count, :integer, default: 0
  end
end
