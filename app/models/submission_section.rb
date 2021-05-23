class SubmissionSection < ApplicationRecord
  belongs_to :submission
  has_many :submission_rows, dependent: :destroy
end
