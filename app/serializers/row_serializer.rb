class RowSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :section
  has_many :columns
end
