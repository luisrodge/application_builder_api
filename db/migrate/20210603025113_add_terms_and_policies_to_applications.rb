class AddTermsAndPoliciesToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :terms, :text
    add_column :applications, :policies, :text
  end
end
