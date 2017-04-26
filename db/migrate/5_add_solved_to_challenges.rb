class AddSolvedToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :solved, :boolean, :default => false
  end
end
