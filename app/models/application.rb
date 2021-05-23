class Application < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :submissions, dependent: :destroy

  validates :title, presence: true
end
