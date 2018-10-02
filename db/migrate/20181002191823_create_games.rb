class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :round, foreign_key: true
      t.integer :team_a
      t.integer :team_b
      t.string :score
      t.integer :winner

      t.timestamps
    end
  end
end
