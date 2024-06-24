class CreateRanks < ActiveRecord::Migration[7.1]
  def change
    create_table :ranks do |t|
      t.references :student, null: false, foreign_key: true

      t.integer :rank_value

      t.timestamps
    end
  end
end

