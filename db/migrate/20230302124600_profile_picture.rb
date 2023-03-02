class ProfilePicture < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :profilepicture, :text
  end
end
