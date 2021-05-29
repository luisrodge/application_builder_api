class Application < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :submissions, dependent: :destroy

  validates :title, presence: true
  validates :email, presence: true

  before_validation :generate_short_url

  def generate_short_url
    self.short_url = SecureRandom.uuid[0..5]
  end
end
