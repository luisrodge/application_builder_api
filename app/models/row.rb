class Row < ApplicationRecord
  belongs_to :section
  has_many :columns, dependent: :destroy
  has_many :elements, dependent: :destroy
end
