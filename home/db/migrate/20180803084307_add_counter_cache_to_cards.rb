class AddCounterCacheToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :comments_count, :integer
  end
end
