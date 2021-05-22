class AddNameToInputs < ActiveRecord::Migration[6.1]
  def change
    add_column(:inputs, :name, :string)
    add_index(:inputs, :name, unique: true)
  end
end
