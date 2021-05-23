class SubmissionRow < ApplicationRecord
  belongs_to :submission_section
  has_many :submission_columns, dependent: :destroy
end
