class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :creator_id, null: false
      t.boolean :public, default: false
    end
  end
end
