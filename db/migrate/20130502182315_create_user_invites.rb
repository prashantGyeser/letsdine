class CreateUserInvites < ActiveRecord::Migration
  def change
    create_table :user_invites do |t|
      t.integer :user_id
      t.text :email_invites
      t.string :facebook_share

      t.timestamps
    end
  end
end
