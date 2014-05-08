class UpdateConfirmableDeviseUsers < ActiveRecord::Migration
  def change
  	add_index :users, :confirmation_token, :unique => true
  	User.update_all(:confirmed_at => Time.now)
  end
end
