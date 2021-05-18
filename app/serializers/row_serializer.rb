class RowSerializer < ActiveModel::Serializer
  attributes :id, :section_id

  belongs_to :section
  has_many :columns
end
