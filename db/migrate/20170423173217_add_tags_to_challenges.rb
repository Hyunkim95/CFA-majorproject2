class AddTagsToChallenges < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :tags, :string
  end
end
