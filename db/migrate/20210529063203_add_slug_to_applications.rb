class AddSlugToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :short_url, :string
    add_index :applications, :short_url, unique: true
  end
end
