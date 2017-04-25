class AddColumnsToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :rules, :text
    add_column :challenges, :deadline, :date
  end
end
