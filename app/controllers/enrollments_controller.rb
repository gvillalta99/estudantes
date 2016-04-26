class EnrollmentsController < ApplicationController
  def index
  end

  def create
    Classroom.create(enrollment_params)
    redirect_to enrollments_path
  end

  private
    def enrollment_params
      params.require(:enrollment).permit(:student_id, :course_id, :entry_at)
    end
end
