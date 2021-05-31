class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :slug, :short_url, :email

  has_many :sections
end
