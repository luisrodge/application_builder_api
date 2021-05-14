class Column < ApplicationRecord
  belongs_to :row
  belongs_to :section
  has_many :elements, dependent: :destroy
end
