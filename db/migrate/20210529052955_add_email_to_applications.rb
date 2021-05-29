class AddEmailToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :email, :string, null: false
  end
end
