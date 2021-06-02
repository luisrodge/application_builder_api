class RowSerializer < ActiveModel::Serializer
  attributes :id, :section_id, :title, :details

  belongs_to :section
  has_many :columns
end
