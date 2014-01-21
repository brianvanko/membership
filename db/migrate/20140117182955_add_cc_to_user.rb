class AddCcToUser < ActiveRecord::Migration
  def change
    add_column :users, :cardTokenURI, :string
  end
end
