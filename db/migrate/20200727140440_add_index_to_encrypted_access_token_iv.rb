class AddIndexToEncryptedAccessTokenIv < ActiveRecord::Migration[5.2]
  def change
    add_index :instagram_access_tokens, :encrypted_access_token_iv, unique: true
  end
end
