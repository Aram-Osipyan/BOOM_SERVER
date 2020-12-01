class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, default: ''
      t.string :password_digest
      t.timestamps
    end
  end
end
