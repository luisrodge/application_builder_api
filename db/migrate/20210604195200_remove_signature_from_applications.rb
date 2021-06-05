class RemoveSignatureFromApplications < ActiveRecord::Migration[6.1]
  def change
    remove_column :applications, :signature, :text
  end
end
