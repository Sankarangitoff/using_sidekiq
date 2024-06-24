class Score < ApplicationRecord
  belongs_to :student
  belongs_to :subject

  validates :student_id, presence: true
  validates :subject_id, presence: true
  validates :score, presence: true
end
