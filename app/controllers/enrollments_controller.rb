class EnrollmentsController < ApplicationController
  def index
  end

  def create
    redirect_to enrollments_path
  end
end
