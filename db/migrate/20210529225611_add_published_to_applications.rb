class AddPublishedToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :published, :boolean, default: false
  end
end
