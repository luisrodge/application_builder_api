class InputSerializer < ActiveModel::Serializer
  attributes :id, :label, :required, :column_id, :type

  belongs_to :column
end
