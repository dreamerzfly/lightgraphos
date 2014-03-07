class AddConfirmableToDevise < ActiveRecord::Migration
  def change
  	add_column :visitors, :confirmation_token, :string
  	add_column :visitors, :confirmed_at, :datetime
  	add_column :visitors, :confirmation_sent_at, :datetime
  	add_column :visitors, :unconfirmed_email, :string
  end
end
