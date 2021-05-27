class FilledInput < ApplicationRecord
  belongs_to :input, optional: true
  belongs_to :submission
  belongs_to :submission_column

  has_one_attached :file, dependent: :destroy
end
