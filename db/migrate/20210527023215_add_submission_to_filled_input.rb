class AddSubmissionToFilledInput < ActiveRecord::Migration[6.1]
  def change
    add_reference :filled_inputs, :submission, null: false, foreign_key: true
  end
end
