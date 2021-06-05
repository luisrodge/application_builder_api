class ChangeDefaultValueForSignatureEnabled < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:applications, :signature_enabled, true)
  end

  def down
    change_column_default(:applications, :signature_enabled, false)
  end
end
