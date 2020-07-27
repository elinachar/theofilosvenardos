class CreateInstagramAccessToken < ActiveRecord::Migration[5.2]
  def change
    create_table :instagram_access_tokens do |t|
      t.string :encrypted_message
      t.string :encrypted_message_iv
    end
  end
end
