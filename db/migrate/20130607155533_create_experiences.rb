class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :about
      t.string :address
      t.string :city
      t.integer :cost
      t.integer :min_pax
      t.string :experience_picture

      t.timestamps
    end
  end
end
