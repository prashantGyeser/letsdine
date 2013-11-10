class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.text :story
      t.string :host_picture

      t.timestamps
    end
  end
end
