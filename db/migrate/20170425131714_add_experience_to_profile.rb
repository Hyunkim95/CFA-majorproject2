class AddExperienceToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :experience, :text, default: "Enter resume info here"
  end
end
