class StudentsController < ApplicationController
  def index
    @students = Student.all
    # render :index
  end

  def show
    @student = Student.find_by(id: params[:id])
    # render :show
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      # redirect_to new_students_path
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :dob, :cohort_id)
  end
end
