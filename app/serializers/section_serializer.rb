class SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :details

  belongs_to :application
  has_many :rows
end
