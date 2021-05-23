class CreateSubmissionRows < ActiveRecord::Migration[6.1]
  def change
    create_table :submission_rows do |t|
      t.references :submission_section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
