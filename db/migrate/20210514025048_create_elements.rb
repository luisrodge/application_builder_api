class CreateElements < ActiveRecord::Migration[6.1]
  def change
    create_table :elements do |t|
      t.references :section, null: false, foreign_key: true
      t.references :row, null: false, foreign_key: true
      t.references :column, null: false, foreign_key: true
      t.references :element_type, null: false, foreign_key: true
      t.string :label

      t.timestamps
    end
  end
end
