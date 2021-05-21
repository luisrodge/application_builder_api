class Input < ApplicationRecord
  belongs_to :column

  validates :label, presence: true
end
