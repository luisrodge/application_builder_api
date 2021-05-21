class InputSerializer < ActiveModel::Serializer
  attributes :id, :label, :required, :column_id, :input_type, :section_id

  belongs_to :column

  def section_id
    object.column.section.id
  end
end
