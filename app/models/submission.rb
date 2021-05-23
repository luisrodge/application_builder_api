class Submission < ApplicationRecord
  belongs_to :application
  has_many :submission_sections, dependent: :destroy
end
