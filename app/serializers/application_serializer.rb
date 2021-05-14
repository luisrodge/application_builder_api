class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :title, :details
  
  has_many :sections
end
