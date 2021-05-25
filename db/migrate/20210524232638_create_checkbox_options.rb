class CreateCheckboxOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :checkbox_options do |t|
      t.string :name
      t.references :input, null: false, foreign_key: true

      t.timestamps
    end
  end
end
