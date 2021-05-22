class Input < ApplicationRecord
  belongs_to :column
  has_may :filled_inputs

  validates :label, presence: true
end
