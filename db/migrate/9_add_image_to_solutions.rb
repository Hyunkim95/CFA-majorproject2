class AddImageToSolutions < ActiveRecord::Migration[5.0]
  def change
    add_column :solutions, :image, :string
  end
end
