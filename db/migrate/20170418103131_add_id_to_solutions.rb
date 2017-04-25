class AddIdToSolutions < ActiveRecord::Migration[5.0]
  def change
    add_column :solutions, :user_id, :integer
    add_column :solutions, :challenge_id, :integer
  end
end
