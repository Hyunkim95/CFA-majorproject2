class CreateChallengeSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :challenge_solutions do |t|

      t.timestamps
    end
  end
end
