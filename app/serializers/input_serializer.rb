class InputSerializer < ActiveModel::Serializer
  attributes :id, :label, :required, :column_id, :input_type

  belongs_to :column
end
