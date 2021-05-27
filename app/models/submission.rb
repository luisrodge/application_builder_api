class Submission < ApplicationRecord
  belongs_to :application
  has_many :submission_sections, dependent: :destroy
  has_many :filled_inputs, dependent: :destroy

  accepts_nested_attributes_for :submission_sections, allow_destroy: true
end
