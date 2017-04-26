class AddSolutionToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :solution, :integer
  end
end
