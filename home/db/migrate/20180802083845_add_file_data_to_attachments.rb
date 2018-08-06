class AddFileDataToAttachments < ActiveRecord::Migration[5.2]
  def change
    add_column :attachments, :file_date, :text
  end
end
