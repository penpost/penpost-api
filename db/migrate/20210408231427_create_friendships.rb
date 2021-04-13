class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :current, default: true

      t.timestamps
    end
    add_index :friendships, :sender_id
    add_index :friendships, :receiver_id
  end
end
