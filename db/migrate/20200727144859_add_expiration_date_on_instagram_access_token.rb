class AddExpirationDateOnInstagramAccessToken < ActiveRecord::Migration[5.2]
  def change
    add_column :instagram_access_tokens, :expires_at, :string 
  end
end
