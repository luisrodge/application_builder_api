class SubmissionSection < ApplicationRecord
  belongs_to :submission
  has_many :submission_rows, dependent: :destroy

  accepts_nested_attributes_for :submission_rows, allow_destroy: true
end
