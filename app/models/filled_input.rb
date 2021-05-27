class FilledInput < ApplicationRecord
  belongs_to :input, optional: true
  belongs_to :submission_column
  has_one_attached :file

  # accepts_nested_attributes_for :file, allow_destroy: true
end
