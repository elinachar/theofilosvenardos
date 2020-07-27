class RenameAccessTokenTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :instagram_access_tokens, :encrypted_message, :encrypted_access_token
    rename_column :instagram_access_tokens, :encrypted_message_iv, :encrypted_access_token_iv
  end
end
