class RemoveImgUrlColumnToCompanies < ActiveRecord::Migration
  def change
  	remove_column :companies, :img_url
  end
end
