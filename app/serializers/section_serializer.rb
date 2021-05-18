class SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :application_id

  belongs_to :application
  has_many :rows
end
