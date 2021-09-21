class CreateMlModels < ActiveRecord::Migration[6.1]
  def change
    create_table :ml_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
