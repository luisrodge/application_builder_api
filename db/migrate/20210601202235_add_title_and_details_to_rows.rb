class AddTitleAndDetailsToRows < ActiveRecord::Migration[6.1]
  def change
    add_column :rows, :title, :string
    add_column :rows, :details, :text
  end
end
