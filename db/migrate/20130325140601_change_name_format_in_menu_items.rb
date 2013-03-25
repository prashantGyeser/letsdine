class ChangeNameFormatInMenuItems < ActiveRecord::Migration
  def up
  	change_column :menu_items, :name, :text
  end

  def down
  	change_column :menu_items, :name, :string
  end
end
