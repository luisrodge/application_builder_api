class Input < ApplicationRecord
  belongs_to :column
  has_many :filled_inputs, dependent: :destroy
  has_many :checkbox_options, dependent: :destroy
  has_many :radio_options, dependent: :destroy

  validates :label, presence: true

  before_create :set_name

  private

  def set_name
    self.name = generate_name
  end

  def generate_name
    loop do
      name = SecureRandom.urlsafe_base64
      break name unless Input.where(name: name).exists?
    end
  end
end
