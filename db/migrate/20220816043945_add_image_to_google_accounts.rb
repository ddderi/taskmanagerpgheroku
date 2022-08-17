class AddImageToGoogleAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :google_accounts, :image, :text
  end
end
