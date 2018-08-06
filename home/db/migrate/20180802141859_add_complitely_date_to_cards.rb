class AddComplitelyDateToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :complitely_date, :datetime
  end
end
