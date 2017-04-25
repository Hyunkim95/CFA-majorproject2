class AddChallengeimageToChallenge < ActiveRecord::Migration[5.0]
  def change
    add_column :challenges, :challengeimage, :string
  end
end
