class AddSeatsAndDescToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :max_seats, :integer
    add_column :plans, :description, :text
  end
end
