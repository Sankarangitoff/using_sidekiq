module Api
  module V1
    class StudentsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:publish_score]

      def publish_score
        student_id = params[:student_id]
        subject_id = params[:subject_id]

        student = Student.find(student_id)
        subject = Subject.find(subject_id)

        total_score = calculate_score(student, subject)

        score = Score.create(student_id: student_id, subject_id: subject_id, score: total_score)

        render json: { status: 'Score published successfully', score: score }
        # CalculateScoreAndRankJob.perform_later(student_id, subject_id)
        # render json: { message: 'Score calculation job enqueued' }, status: :ok
      end

      def scores_and_ranks
        student = Student.find(params[:id])
        scores = Score.where(student_id: student.id)
        total_scores = scores.sum(:score)
        rank = Score.where('score > ?', total_scores).count + 1

        render json: {
          student: student,
          scores: scores,
          total_scores: total_scores,
          rank: rank
        }
      end

      private

       def calculate_score(student, subject)
        quiz_scores = Quiz.where(student: student, subject: subject).pluck(:score)
        assignment_scores = Assignment.where(student: student, subject: subject).pluck(:score)
        exam_scores = Exam.where(student: student, subject: subject).pluck(:score)


        quiz_weight = 0.3
        assignment_weight = 0.4
        exam_weight = 0.3

        total_score = (
          (quiz_scores.sum * quiz_weight) +
          (assignment_scores.sum * assignment_weight) +
          (exam_scores.sum * exam_weight)
        ).to_i

         total_score
      end
      # def set_student
      #   @student = Student.find(params[:id])
      # end
    end
  end
end

