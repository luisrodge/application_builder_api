class Application < ApplicationRecord
  extend FriendlyId

  has_many :sections, dependent: :destroy
  has_many :submissions, dependent: :destroy

  validates :title, presence: true
  validates :email, presence: true

  before_validation :generate_short_url, on: :create

  friendly_id :title, use: :slugged

  def generate_short_url
    self.short_url =
      loop do
        random_short_url = SecureRandom.alphanumeric(7)
        break random_short_url unless Application.exists?(short_url: random_short_url)
      end
  end

  def apply_links
    { short_url: short_url, url: slug }
  end
end
