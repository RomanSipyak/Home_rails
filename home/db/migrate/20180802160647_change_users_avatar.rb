class ChangeUsersAvatar < ActiveRecord::Migration[5.2]
  def change
    reversible do |dir|
      change_table :users do |t|
        dir.up   { t.change :avatar, :text }
        dir.down { t.change :avatar, :string }
      end
    end
  end
end
