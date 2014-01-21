class AddSoManyFieldsToCompanies < ActiveRecord::Migration
  def change
      add_column :companies, :phone, :string
      add_column :companies, :address, :string
      add_column :companies, :city, :string
      add_column :companies, :state, :string
      add_column :companies, :zipcode, :string
      add_column :companies, :image_url, :string
      add_column :companies, :url, :string
      add_column :companies, :description, :string

  end
end
