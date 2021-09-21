class AddEmotionsToUpload < ActiveRecord::Migration[6.1]
  def change
    add_column :uploads, :emotions, :json
  end
end
