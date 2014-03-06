class AddLatLongToCompanies < ActiveRecord::Migration
  def change
  	add_column :companies, :latitutude, :float
  	add_column :companies, :longitude, :float
  end
end
