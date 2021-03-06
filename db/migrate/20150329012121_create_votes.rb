class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :choice_id, null: false
    end

    add_index :votes, [:user_id, :choice_id]
    add_index :votes, :user_id
    add_index :votes, :choice_id
  end
end
