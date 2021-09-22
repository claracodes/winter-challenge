class AddEmotionToActiveStorageAttachments < ActiveRecord::Migration[6.1]
  def change
    add_column :active_storage_attachments, :emotion, :string
  end
end
