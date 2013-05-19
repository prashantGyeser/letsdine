class CreateNewCityNotifications < ActiveRecord::Migration
  def change
    create_table :new_city_notifications do |t|
      t.string :city
      t.string :email

      t.timestamps
    end
  end
end
