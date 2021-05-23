class CreateFilledInputs < ActiveRecord::Migration[6.1]
  def change
    create_table :filled_inputs do |t|
      t.string :input_type
      t.string :value
      t.string :label
      t.references :input, null: false, foreign_key: true
      t.references :submission_column, null: false, foreign_key: true

      t.timestamps
    end
  end
end
