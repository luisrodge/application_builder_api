class CreateInputs < ActiveRecord::Migration[6.1]
  def change
    create_table(:inputs) do |t|
      t.string(:label)
      t.boolean(:required, default: false)
      t.references(:column, null: false, foreign_key: true)
      t.string(:input_type)

      t.timestamps
    end
  end
end
