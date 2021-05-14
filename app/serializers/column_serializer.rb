class ColumnSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :row
end
