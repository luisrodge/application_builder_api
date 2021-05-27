class SubmissionRow < ApplicationRecord
  belongs_to :submission_section
  has_many :submission_columns, dependent: :destroy

  accepts_nested_attributes_for :submission_columns, allow_destroy: true
end
