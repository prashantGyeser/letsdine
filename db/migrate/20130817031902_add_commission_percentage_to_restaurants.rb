class AddCommissionPercentageToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :commission_percentage, :decimal
  end
end
