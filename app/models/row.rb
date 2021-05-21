class Row < ApplicationRecord
  belongs_to :section
  has_many :columns, dependent: :destroy

  attribute :num_of_cols, :integer

  after_create :create_columns, if: :num_of_cols?

  private

  def create_columns
    num_of_cols.times do
      Column.create(row_id: id, section_id: section_id)
    end
  end
end
