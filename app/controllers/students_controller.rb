class StudentsController < ApplicationController

  def new
    @student = Student.new
    teach_id = params[:user_id]
    @teacher = Teacher.find_by(id: teach_id)
    render :new
  end

  def create
    teacher = Teacher.find(params[:user_id])
    new_student = Student.new(student_params)
    teach_id = current_user[:id]
    new_student[:user_id] = teach_id
    if new_student.save
      flash[:success] = "Successfully added new student"
      teacher.students << new_student
      redirect_to root_path
    else
      flash[:error] = new_student.errors.full_messages.join(", ")
      redirect_to new_user_student_path(user)
    end
  end

  def index
    render :index
  end

  def about
    render :about
  end

  def join
    render :join
  end

  private

  def student_params
    params.require(:student).permit(:f_name, :l_name, :grade, :notes)
  end


end
