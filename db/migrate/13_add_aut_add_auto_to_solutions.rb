class AddAutAddAutoToSolutions < ActiveRecord::Migration[5.0]
  def change
    add_column :solutions, :auto, :boolean
  end
end
