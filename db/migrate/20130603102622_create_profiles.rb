class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :picture
      t.text :about

      t.timestamps
    end
  end
end
