class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.integer :user_sender_id
      t.integer :user_receiver_id
      t.string :content

      t.timestamps
    end
  end
end
