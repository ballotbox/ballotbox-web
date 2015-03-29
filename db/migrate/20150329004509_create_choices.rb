class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :body, null: false
      t.integer :election_id, null: false
    end
  end
end
