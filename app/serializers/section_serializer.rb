class SectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :application_id, :application_slug

  belongs_to :application
  has_many :rows

  def application_slug
    object.application.slug
  end
end
