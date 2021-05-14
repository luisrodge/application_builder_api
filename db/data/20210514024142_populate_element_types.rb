class PopulateElementTypes < ActiveRecord::Migration[6.1]

  def up
    element_types = ['Text Input', 'Number Input', 'Date Picker']

    element_types.each do |type|
      ElementType.create(name: type)
    end
  end

  def down
    ElementType.destroy_all
  end
end
