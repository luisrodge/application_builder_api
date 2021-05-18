class ColumnSerializer < ActiveModel::Serializer
  attributes :id, :row_id, :section_id

  belongs_to :row
  belongs_to :section
end
