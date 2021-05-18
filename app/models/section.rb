class Section < ApplicationRecord
  belongs_to :application
  has_many :rows, dependent: :destroy
  has_many :columns, dependent: :destroy
  has_many :elements, dependent: :destroy

  validates :title, presence: true

  attribute :num_of_cols, :integer

  after_create :create_row_columns

  private

  def create_row_columns
    row = Row.create(section_id: id)
    num_of_cols.times do
      Column.create(row_id: row.id, section_id: id)
    end
  end
end
