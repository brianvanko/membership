class RemoveLat < ActiveRecord::Migration
  def change
  	 remove_column :companies, :latitutude
  end
end
