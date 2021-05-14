class Section < ApplicationRecord
  belongs_to :application
  has_many :rows, dependent: :destroy
  has_many :columns, dependent: :destroy
  has_many :elements, dependent: :destroy
end
