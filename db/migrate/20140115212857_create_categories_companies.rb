class CreateCategoriesCompanies < ActiveRecord::Migration
  def change
    create_table :categories_companies do |t|
      t.integer :company_id
      t.integer :category_id
    end
  end
end
