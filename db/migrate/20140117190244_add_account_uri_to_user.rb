class AddAccountUriToUser < ActiveRecord::Migration
  def change
    add_column :users, :accountURI, :string
  end
end
