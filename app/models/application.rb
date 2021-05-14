class Application < ApplicationRecord
  has_many :sections, dependent: :destroy
end
