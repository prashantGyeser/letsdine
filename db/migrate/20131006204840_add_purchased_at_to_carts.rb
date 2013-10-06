class AddPurchasedAtToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :purchased_at, :date
  end
end
