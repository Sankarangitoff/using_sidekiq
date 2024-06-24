# app/jobs/calculate_score_and_rank_job.rb
class CalculateScoreAndRankJob < ApplicationJob
  queue_as :default

  def perform(student_id, subject_id)
    student = Student.find(student_id)
    subject = Subject.find(subject_id)

    if student.nil? || subject.nil?
      Rails.logger.error("Student or Subject not found")
      return
    end
    # Calculate total score, average score, and rank for the student in the given subject
    total_score = calculate_total_score(student, subject)
    average_score = calculate_average_score(student, subject)
    rank = calculate_rank(student, subject, total_score)

    # Save or update the score and rank in the database
    Score.create_or_update_by(student: student, subject: subject) do |score|
      score.value = total_score
    end

    Rank.create_or_update_by(student: student, subject: subject) do |rank|
      rank.value = rank
    end
  end

  

  private

  def calculate_total_score(student, subject)
    quizzes_score = student.quizzes.where(subject: subject).sum(:score)
    assignments_score = student.assignments.where(subject: subject).sum(:score)
    exams_score = student.exams.where(subject: subject).sum(:score)

    total_score = quizzes_score + assignments_score + exams_score
    total_score
  end

  def calculate_average_score(student, subject)
    total_score = calculate_total_score(student, subject)
    total_items = student.quizzes.where(subject: subject).count +
                  student.assignments.where(subject: subject).count +
                  student.exams.where(subject: subject).count

    average_score = total_items.zero? ? 0 : total_score / total_items.to_f
    average_score
  end

  def calculate_rank(student, subject, total_score)
    # Get all students' total scores in the given subject
    students_scores = Student.all.map do |s|
      calculate_total_score(s, subject)
    end

    # Sort scores in descending order and find the rank
    sorted_scores = students_scores.sort.reverse
    rank = sorted_scores.index(total_score) + 1
    rank
  end
end
