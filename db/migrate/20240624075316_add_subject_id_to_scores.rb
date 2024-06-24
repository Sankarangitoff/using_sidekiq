class AddSubjectIdToScores < ActiveRecord::Migration[7.1]
  def change
    add_column :scores, :subject_id, :integer
    add_index :scores, :subject_id
  end
end
