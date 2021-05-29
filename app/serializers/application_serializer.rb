class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :details, :slug
  
  has_many :sections
end
