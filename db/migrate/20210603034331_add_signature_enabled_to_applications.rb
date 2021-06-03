class AddSignatureEnabledToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column(:applications, :signature_enabled, :boolean, default: false)
  end
end
