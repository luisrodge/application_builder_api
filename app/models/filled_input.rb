class FilledInput < ApplicationRecord
  belongs_to :input,  optional: true
  belongs_to :submission_column
end
