class Column < ApplicationRecord
  belongs_to :row
  belongs_to :section
  has_one :input, dependent: :destroy
end
