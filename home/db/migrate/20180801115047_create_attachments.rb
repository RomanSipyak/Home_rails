class CreateAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :attachments do |t|
      t.references :file_container, polymorphic: true, index: true
      t.timestamps
    end
  end
end
