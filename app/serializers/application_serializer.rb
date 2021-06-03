class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :slug, :short_url, :email, :terms, :policies

  has_many :sections
end
