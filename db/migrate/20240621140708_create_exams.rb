class CreateExams < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.references :student, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
