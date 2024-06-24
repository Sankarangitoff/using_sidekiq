class Subject < ApplicationRecord
  has_many :quizzes
  has_many :assignments
  has_many :exams
end