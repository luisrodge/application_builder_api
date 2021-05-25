class InputSerializer < ActiveModel::Serializer
  attributes :id, :label, :name, :required, :column_id, :input_type, :section_id

  belongs_to :column
  has_many :checkbox_options
  has_many :radio_options

  def section_id
    object.column.section.id
  end

  class CheckboxOptionSerializer < ActiveModel::Serializer
    attributes :id, :name
  end

  class RadioOptionSerializer < ActiveModel::Serializer
    attributes :id, :name
  end
end
