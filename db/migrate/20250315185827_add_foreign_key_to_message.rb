class AddForeignKeyToMessage < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :messages, :users, column: :user_sender_id
    add_foreign_key :messages, :users, column: :user_receiver_id
  end
end
