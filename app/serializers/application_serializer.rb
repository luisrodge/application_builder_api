class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :slug, :short_url, :email, :terms, :policies, :signature_enabled

  has_many :sections
end
