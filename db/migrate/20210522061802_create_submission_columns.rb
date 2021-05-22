class CreateSubmissionColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :submission_columns do |t|
      t.references :submission_row, null: false, foreign_key: true

      t.timestamps
    end
  end
end
