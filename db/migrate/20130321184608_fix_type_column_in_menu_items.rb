class FixTypeColumnInMenuItems < ActiveRecord::Migration
  def up
  	rename_column :menu_items, :type, :course_name
  end

  def down
  	rename_column :menu_items, :course_name, :type
  end
end
