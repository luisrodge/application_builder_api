class AddSignatureToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_column :submissions, :signature, :text
  end
end
