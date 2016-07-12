class AddFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile_pic, :string
    add_column :users, :bio, :string
    add_column :users, :oauth_token, :string
  end
end
