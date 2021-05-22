class CreateSubmissionSections < ActiveRecord::Migration[6.1]
  def change
    create_table :submission_sections do |t|
      t.string :title
      t.text :details
      t.references :submission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
