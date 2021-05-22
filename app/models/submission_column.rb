class SubmissionColumn < ApplicationRecord
  belongs_to :submission_row
  has_one :filled_input, dependent: :destroy
end
