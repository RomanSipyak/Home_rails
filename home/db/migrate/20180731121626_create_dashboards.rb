class CreateDashboards < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboards do |t|
      t.string :title
      t.boolean :visions
      t.integer :user_id
      t.timestamps

    end
  end
end
