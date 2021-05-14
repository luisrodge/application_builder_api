class CreateRows < ActiveRecord::Migration[6.1]
  def change
    create_table :rows do |t|
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
