class CreateJoinTableCardsUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :cards, :users do |t|
      t.index [:card_id, :user_id]
    end
  end
end
