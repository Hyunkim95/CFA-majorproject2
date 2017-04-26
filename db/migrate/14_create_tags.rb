class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :list, array:true, default: [].to_yaml

      t.timestamps
    end
  end
end
