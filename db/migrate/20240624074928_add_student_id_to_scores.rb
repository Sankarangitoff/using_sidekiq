class AddStudentIdToScores < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :student_id, :integer
    add_index :scores, :student_id
  end
end
