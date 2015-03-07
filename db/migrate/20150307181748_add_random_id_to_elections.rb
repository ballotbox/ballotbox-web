class AddRandomIdToElections < ActiveRecord::Migration
  def change
    add_column :elections, :random_id, :string
  end
end
