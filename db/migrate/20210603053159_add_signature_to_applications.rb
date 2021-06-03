class AddSignatureToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :signature, :text
  end
end
