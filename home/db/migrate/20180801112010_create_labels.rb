class CreateLabels < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :color
      t.string :name
      t.integer :dashboard_id

      t.timestamps
    end
  end
end
