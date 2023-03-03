class CheckTweet < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :check, :boolean
  end
end
