class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :description
      t.datetime :date
      t.integer :list_id
      t.timestamps
    end
  end
end
