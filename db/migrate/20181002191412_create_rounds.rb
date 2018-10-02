class CreateRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :rounds do |t|
      t.string :round_type
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
