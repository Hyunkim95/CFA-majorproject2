class AddDefaultToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :tags, :string, hash:true, :default => {}.to_yaml
  end
end
