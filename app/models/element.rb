class Element < ApplicationRecord
  belongs_to :section
  belongs_to :row
  belongs_to :column
  belongs_to :element_type
end
