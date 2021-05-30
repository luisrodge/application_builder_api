class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :slug, :short_url

  has_many :sections
end
