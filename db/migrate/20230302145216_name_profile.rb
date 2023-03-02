class NameProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :name, :string
  end
end
