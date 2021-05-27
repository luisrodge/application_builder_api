class SubmissionColumn < ApplicationRecord
  belongs_to :submission_row
  has_one :filled_input, dependent: :destroy

  accepts_nested_attributes_for :filled_input, allow_destroy: true
end
